output "resource_group_name" {
  value       = ibm_resource_group.resource_group.name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = ibm_resource_group.resource_group.id
  description = "Resource group ID"
}
