<!-- Update the title to match the module name -->
# Resource group module

<!-- UPDATE BADGE: Update the link for the badge below-->
[![Build Status](https://github.com/terraform-ibm-modules/terraform-ibm-resource-group/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-ibm-modules/terraform-ibm-resource-group/actions/workflows/ci.yml)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This module returns the ID for the name of a resource group. It can also create a group from a name and return the ID.

## Usage
<!-- Add sample usage of the module itself in the code block below -->
Existing resource group
```hcl
module "resource_group" {
  # Replace "main" with a GIT release version to lock into a specific release
  source                       = "git::https://github.com/terraform-ibm-resource-group/terraform-ibm-resource-group.git?ref=main"
  existing_resource_group_name = var.resource_group_name
}
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "Resource group ID"
}

```

New resource group
```hcl
module "resource_group" {
  # Replace "main" with a GIT release version to lock into a specific release
  source                       = "git::https://github.com/terraform-ibm-resource-group/terraform-ibm-resource-group.git?ref=main"
  resource_group_name = var.resource_group_name
}
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "Resource group ID"
}
```

## Required IAM access policies
You need the following permissions to run this module.

- Account Management
  - **All Account Management Services** service
      - `Administrator` platform access

<!-- BEGIN EXAMPLES HOOK -->
## Examples

- [ Existing Resource Group](examples/existing-resource-group)
- [ New Resource Group Example](examples/new-resource-group)
<!-- END EXAMPLES HOOK -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_group) | resource |
| [ibm_resource_group.existing_resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | Name of the existing resource group.  Required if not creating new resource group | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create. Required if not using existing resource group | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource group ID |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.

<!-- END CONTRIBUTING HOOK -->
