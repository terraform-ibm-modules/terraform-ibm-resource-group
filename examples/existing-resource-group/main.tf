module "resource_group" {
  source                       = "../../"
  existing_resource_group_name = var.existing_resource_group_name != "" ? var.existing_resource_group_name : null
  existing_resource_group_id   = var.existing_resource_group_id
}
