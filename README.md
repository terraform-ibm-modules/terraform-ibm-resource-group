# Resource group module

[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-resource-group?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-resource-group/releases/latest)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

This module returns the ID for the name of a resource group. It can also create a group from a name and return the ID. The module will return the ID of the default resource group if no name is passed.

<!-- Below content is automatically populated via pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-resource-group](#terraform-ibm-resource-group)
* [Examples](./examples)
    * [Default resource group example](./examples/default-resource-group)
    * [Existing resource group example](./examples/existing-resource-group)
    * [New resource group example](./examples/new-resource-group)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->

<!-- This heading should always match the name of the root level module (aka the repo name) -->
## terraform-ibm-resource-group

### Usage
Create new Resource group:
```hcl
module "resource_group" {
  source              = "terraform-ibm-modules/resource-group/ibm"
  version             = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release
  resource_group_name = "new-resource-group"
}
```
Return ID of an existing Resource group:
```hcl
module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release
  existing_resource_group_name = "existing-resource-group"
}
```
Return ID of the default Resource group:
```hcl
module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release
}
```

### Required IAM access policies
You need the following permissions to run this module.

- Account Management
  - **All Account Management Services** service
      - `Administrator` platform access

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_group) | resource |
| [ibm_resource_group.default](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |
| [ibm_resource_group.existing_resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | Name of the existing resource group. When null, set to the account's default resource group. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create. Required if not using existing resource group | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource group ID |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
