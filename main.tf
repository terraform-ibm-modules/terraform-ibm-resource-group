##############################################################################
# terraform-ibm-resource-group-module
#
# Creates a resource group if a new one is requested.
# Otherwise it will look up a provided existing resource group or the account's default resource group
##############################################################################

locals {
  existing_resource_group_name = var.existing_resource_group_name != null ? var.existing_resource_group_name : data.ibm_resource_group.default.name
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
