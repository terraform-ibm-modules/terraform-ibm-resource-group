##############################################################################
# Outputs
##############################################################################

# output "resource_group_name" {
#   description = "Resource group name"
#   value       = local.lookup_default_group ? data.ibm_resource_group.default[0].name : var.resource_group_name != null ? ibm_resource_group.resource_group[0].name : data.ibm_resource_group.existing_resource_group[0].name
# }

# output "resource_group_id" {
#   description = "Resource group ID"
#   value       = local.lookup_default_group ? data.ibm_resource_group.default[0].id : var.resource_group_name != null ? ibm_resource_group.resource_group[0].id : data.ibm_resource_group.existing_resource_group[0].id
# }

output "resource_group_name" {
  description = "Resource group name"
  value       = var.resource_group_name == null ? data.ibm_resource_group.existing_resource_group[0].name : ibm_resource_group.resource_group[0].name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = var.resource_group_name == null ? data.ibm_resource_group.existing_resource_group[0].id : ibm_resource_group.resource_group[0].id
}
##############################################################################
