variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "existing_resource_group_name" {
  type        = string
  description = "Existing Resource group name. Either this or existing_resource_group_id must be provided. Leave empty to use ID instead."
  default     = ""
}

variable "existing_resource_group_id" {
  type        = string
  description = "Existing Resource group ID. This is preferred over name as IDs are static while names can be updated. Terraform will prompt for this value if not provided."
}
