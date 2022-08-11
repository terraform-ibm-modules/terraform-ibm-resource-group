<!-- Update the title to match the module name -->
# Resource group module

<!-- BADGE UPDATES:
1. Update first badge below to the current status of the module. See options at
    https://github.ibm.com/GoldenEye/documentation/blob/master/status.md
2. Update the build status badge to point to the travis pipeline for the module
    TIP: Simply replace the string "module-template" in the 2 places in the Build Status section below
-->
[![Stable](https://img.shields.io/badge/Status-Stable%20(Adopted)-yellowgreen?style=plastic)](https://github.ibm.com/GoldenEye/documentation/blob/master/status.md) [![Build Status](https://travis.ibm.com/GoldenEye/resource-group-module.svg?token=3Ry6sEDNvWajQPuZHgTZ&branch=master)](https://travis.ibm.com/GoldenEye/resource-group-module) [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit) [![Latest release](https://shields-server.m03l6u0cqkx.eu-de.codeengine.appdomain.cloud/github/v/release/GoldenEye/resource-group-module?logo=GitHub)](https://github.ibm.com/GoldenEye/resource-group-module/releases/latest)

This module returns the ID for the name of a resource group. It can also create a group from a name and return the ID.

## Usage
<!-- Add sample usage of the module itself in the code block below -->
Existing resource group
```hcl
module "resource_group" {
  # Replace "master" with a GIT release version to lock into a specific release
  source                       = "git::https://git@github.ibm.com/GoldenEye/resource-group-module.git?ref=master"
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
  # Replace "master" with a GIT release version to lock into a specific release
  source                       = "git::https://git@github.ibm.com/GoldenEye/resource-group-module.git?ref=master"
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

For more information about the access you need to run all the GoldenEye modules, see [GoldenEye IAM permissions](https://github.ibm.com/GoldenEye/documentation/blob/master/goldeneye-iam-permissions.md).

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
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.41.1 |

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

## Developing

To set up your local development environment, see steps [here](https://github.ibm.com/GoldenEye/documentation/blob/master/local-dev-setup.md)

<!-- BEGIN EXAMPLES HOOK -->
## Examples

- [ Existing Resource Group](examples/existing-resource-group)
- [ New Resource Group Example](examples/new-resource-group)
<!-- END EXAMPLES HOOK -->
