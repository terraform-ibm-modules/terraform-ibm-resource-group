variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Token"
  sensitive   = true
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "test-ar"
}
