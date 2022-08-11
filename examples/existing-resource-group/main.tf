
module "resource_group" {
  source                       = "../../"
  existing_resource_group_name = var.resource_group_name
}
