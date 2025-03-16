##############################################################################
# terraform-ibm-resource-group-module
#
# Looks up resource group and creates a new one if none already exists
##############################################################################

locals {
  # Check only resource group was given or existing group was given but not both
  # (approach based on https://stackoverflow.com/a/66682419)
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
