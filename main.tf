##############################################################################
# terraform-ibm-resource-group-module
#
# Looks up resource group and creates a new one if none already exists
##############################################################################

locals {
  # Check only resource group was given or existing group was given but not both
  # (approach based on https://stackoverflow.com/a/66682419)

  ### Check if both groups were given
  exist_both_resource_group_cdn = !(var.resource_group_name != null && var.existing_resource_group_name != null)
  exist_both_resource_group_msg = "only 'resource_group_name' or 'existing_resource_group_name' can be given, but both have been given"
  # tflint-ignore: terraform_unused_declarations
  exist_both_resource_group_check = regex("^${local.exist_both_resource_group_msg}$", (local.exist_both_resource_group_cdn ? local.exist_both_resource_group_msg : ""))
}

data "ibm_resource_group" "existing_resource_group" {
  count = var.existing_resource_group_name != null ? 1 : 0
  name  = var.existing_resource_group_name
}

resource "ibm_resource_group" "resource_group" {
  count    = var.existing_resource_group_name != null ? 0 : 1
  name     = var.resource_group_name
  quota_id = null
}
