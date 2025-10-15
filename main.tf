##############################################################################
# terraform-ibm-resource-group-module
#
# Creates a resource group if a new one is requested.
# Otherwise it will look up a provided existing resource group or the account's default resource group
##############################################################################

locals {
  # when resource_group_name is null, lookup account default group if existing_resource_group_name is null, "Default" or "default"
  lookup_default_group         = var.resource_group_name != null ? false : var.existing_resource_group_name != null ? lower(var.existing_resource_group_name) == "default" ? true : false : true
  lookup_existing_group        = var.resource_group_name == null && local.lookup_default_group ? true : false
  existing_resource_group_name = var.existing_resource_group_name != null ? lower(var.existing_resource_group_name) == "default" ? data.ibm_resource_group.default[0].name : var.existing_resource_group_name : var.resource_group_name == null ? data.ibm_resource_group.default[0].name : null
}

data "ibm_resource_group" "default" {
  count      = local.lookup_default_group ? 1 : 0
  is_default = "true"
}

data "ibm_resource_group" "existing_resource_group" {
  count = local.lookup_existing_group ? 1 : 0
  name  = local.existing_resource_group_name
}

resource "ibm_resource_group" "resource_group" {
  count    = var.resource_group_name != null ? 1 : 0
  name     = var.resource_group_name
  quota_id = null
}
