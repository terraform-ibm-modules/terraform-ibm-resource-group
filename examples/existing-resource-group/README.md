# Existing resource group example

<!-- BEGIN SCHEMATICS DEPLOY HOOK -->
<p>
  <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=resource-group-existing-resource-group-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-resource-group/tree/main/examples/existing-resource-group">
    <img src="https://img.shields.io/badge/Deploy%20with%20IBM%20Cloud%20Schematics-0f62fe?style=flat&logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics">
  </a><br>
  ℹ️ Ctrl/Cmd+Click or right-click on the Schematics deploy button to open in a new tab.
</p>
<!-- END SCHEMATICS DEPLOY HOOK -->

An example showing how the module can take in an existing Resource group name or ID, and return the Resource group details as outputs.

You can provide either:
- `existing_resource_group_name` - The name of an existing resource group
- `existing_resource_group_id` - The ID of an existing resource group
