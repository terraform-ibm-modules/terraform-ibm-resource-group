##############################################################################
# Outputs
##############################################################################

output "resource_group_name" {
  description = "Resource group name"
  value       = var.existing_resource_group_name != null ? data.ibm_resource_group.existing_resource_group[0].name : ibm_resource_group.resource_group[0].name
  # explicit dependency required as workaround for https://github.com/IBM-Cloud/terraform-provider-ibm/issues/4170
  depends_on = [ibm_resource_group.resource_group]
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = var.existing_resource_group_name != null ? data.ibm_resource_group.existing_resource_group[0].id : ibm_resource_group.resource_group[0].id
}
##############################################################################
