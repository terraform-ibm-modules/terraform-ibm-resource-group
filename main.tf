##############################################################################
# terraform-ibm-resource-group-module
#
# Creates a resource group if a new one is requested.
# Otherwise it will look up a provided existing resource group or the account's default resource group
##############################################################################

# Use a local variable to determine if the default resource group should be used
locals {
  # Name of default resource group change circa 2019 from default to Default so attempt to return the actual default resource group in this scenario
  use_default_resource_group = var.existing_resource_group_name == null ? true : lower(var.existing_resource_group_name) == "default"

  # Use the local variable to decide which resource group name to use
  existing_resource_group_name = local.use_default_resource_group ? data.ibm_resource_group.default.name : var.existing_resource_group_name
}

data "ibm_resource_group" "default" {
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
