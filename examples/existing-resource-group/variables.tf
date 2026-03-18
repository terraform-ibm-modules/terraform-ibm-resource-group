variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "existing_resource_group_name" {
  type        = string
  description = "Existing Resource group name. Either this or existing_resource_group_id must be provided. Set to null to use ID instead."
  default     = null
}

variable "existing_resource_group_id" {
  type        = string
  description = "Existing Resource group ID. Either this or existing_resource_group_name must be provided. Set to null to use name instead."
  default     = null
}
