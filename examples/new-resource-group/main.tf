module "resource_group" {
  source              = "../../"
  resource_group_name = var.resource_group_name
  existing_resource_group_name = var.resource_group_name
}
