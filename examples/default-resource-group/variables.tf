variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of an existing resource group. When set to `null`, `default` or `Default` the accounts default resource group is returned."
  default     = null
}
