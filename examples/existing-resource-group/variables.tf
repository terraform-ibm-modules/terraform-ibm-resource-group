variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "existing_resource_group_name" {
  type        = string
  description = "Existing Resource group name"
}
