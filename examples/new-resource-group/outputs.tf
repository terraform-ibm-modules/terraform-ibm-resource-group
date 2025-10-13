output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "Resource group name"
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "Resource group ID"
}

resource "null_resource" "get_tf_env" {
  provisioner "local-exec" {
    command = "env"
    interpreter = ["bash", "-c"]
  }
}

output "test" {
value = null_resource.get_tf_env
}
