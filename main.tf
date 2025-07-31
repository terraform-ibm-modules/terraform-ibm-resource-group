##############################################################################
# terraform-ibm-resource-group-module
#
# Creates a resource group if a new one is requested.
# Otherwise it will look up a provided existing resource group or the account's default resource group
##############################################################################

# Use a local variable to determine if the default resource group should be used
locals {
  # Use the local variable to decide which resource group name to use
  existing_resource_group_name = var.existing_resource_group_name == null ? data.ibm_resource_group.default[0].name : var.existing_resource_group_name
}

data "ibm_resource_group" "default" {
  count      = var.existing_resource_group_name == null && var.resource_group_name == null ? 1 : 0
  is_default = "true"
}

data "ibm_resource_group" "existing_resource_group" {
  count = var.resource_group_name != null ? 0 : 1
  name  = local.existing_resource_group_name
}

resource "ibm_resource_group" "resource_group" {
  count    = var.resource_group_name != null ? 1 : 0
  name     = var.resource_group_name
  quota_id = null
}
