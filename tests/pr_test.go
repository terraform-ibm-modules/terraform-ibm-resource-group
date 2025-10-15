// Tests in this file are run in the PR pipeline
package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

const newGroupExampleTerraformDir = "examples/new-resource-group"
const defaultGroupExampleTerraformDir = "examples/default-resource-group"
const existingGroupExampleTerraformDir = "examples/existing-resource-group"

func TestRunNewGroupExample(t *testing.T) {
	t.Parallel()

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: newGroupExampleTerraformDir,
		Prefix:       "new-resource-group",
	})

	options.TerraformVars = map[string]interface{}{
		"resource_group_name": options.Prefix,
	}

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunExistingGroupExample(t *testing.T) {
	t.Parallel()

	prefix := fmt.Sprintf("existing-rg-test-%s", strings.ToLower(random.UniqueId()))
	realTerraformDir := "./existing-resources"
	tempTerraformDir, _ := files.CopyTerraformFolderToTemp(realTerraformDir, fmt.Sprintf(prefix+"-%s", strings.ToLower(random.UniqueId())))

	// Verify ibmcloud_api_key variable is set
	checkVariable := "TF_VAR_ibmcloud_api_key"
	val, present := os.LookupEnv(checkVariable)
	require.True(t, present, checkVariable+" environment variable not set")
	require.NotEqual(t, "", val, checkVariable+" environment variable is empty")

	logger.Log(t, "Tempdir: ", tempTerraformDir)
	existingTerraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: tempTerraformDir,
		Vars: map[string]interface{}{
			"resource_group_name": prefix,
		},
		// Set Upgrade to true to ensure latest version of providers and modules are used by terratest.
		// This is the same as setting the -upgrade=true flag with terraform.
		Upgrade: true,
	})

	terraform.WorkspaceSelectOrNew(t, existingTerraformOptions, prefix)
	_, existErr := terraform.InitAndApplyE(t, existingTerraformOptions)
	if existErr != nil {
		assert.True(t, existErr == nil, "Init and Apply of temp existing resource failed")
	} else {

		options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
			Testing:      t,
			TerraformDir: existingGroupExampleTerraformDir,
			Prefix:       prefix,
		})

		options.TerraformVars = map[string]interface{}{
			"existing_resource_group_name": terraform.Output(t, existingTerraformOptions, "resource_group_name"),
		}

		output, err := options.RunTestConsistency()
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}

	// Check if "DO_NOT_DESTROY_ON_FAILURE" is set
	envVal, _ := os.LookupEnv("DO_NOT_DESTROY_ON_FAILURE")
	// Destroy the temporary existing resources if required
	if t.Failed() && strings.ToLower(envVal) == "true" {
		fmt.Println("Terratest failed. Debug the test and delete resources manually.")
	} else {
		logger.Log(t, "START: Destroy (existing resources)")
		terraform.Destroy(t, existingTerraformOptions)
		terraform.WorkspaceDelete(t, existingTerraformOptions, prefix)
		logger.Log(t, "END: Destroy (existing resources)")
	}
}

func TestRunDefaultGroupExampleUsingNull(t *testing.T) {
	t.Parallel()

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: defaultGroupExampleTerraformDir,
	})

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotEmpty(t, output.RawPlan.OutputChanges["resource_group_id"].After.(string))
	assert.Equal(t, output.RawPlan.OutputChanges["resource_group_name"].After.(string), "Default")
}

func TestRunDefaultGroupExampleUsingCapDefault(t *testing.T) {
	t.Parallel()

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: defaultGroupExampleTerraformDir,
	})

	options.TerraformVars = map[string]interface{}{
		"existing_resource_group_name": "Default",
	}

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotEmpty(t, output.RawPlan.OutputChanges["resource_group_id"].After.(string))
	assert.Equal(t, output.RawPlan.OutputChanges["resource_group_name"].After.(string), "Default")
}

func TestRunDefaultGroupExampleUsingLowerDefault(t *testing.T) {
	t.Parallel()

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: defaultGroupExampleTerraformDir,
	})

	options.TerraformVars = map[string]interface{}{
		"existing_resource_group_name": "default",
	}

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotEmpty(t, output.RawPlan.OutputChanges["resource_group_id"].After.(string))
	assert.Equal(t, output.RawPlan.OutputChanges["resource_group_name"].After.(string), "Default")
}

func TestRunUpgradeExample(t *testing.T) {
	t.Parallel()

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: newGroupExampleTerraformDir,
		Prefix:       "resource-group-upg",
	})

	options.TerraformVars = map[string]interface{}{
		"resource_group_name": options.Prefix,
	}

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}
