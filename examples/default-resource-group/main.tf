module "resource_group" {
  source                       = "../../"
  existing_resource_group_name = var.existing_resource_group_name # values of null, "Default" or "default" will all return default resource group in account
}
