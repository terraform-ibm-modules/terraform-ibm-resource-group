##############################################################################
# Input Variables
##############################################################################

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create. Required if not using existing resource group"
  default     = null
  validation {
    condition     = var.resource_group_name != null ? var.existing_resource_group_name == null : true
    error_message = "only 'resource_group_name' or 'existing_resource_group_name' can be given, but both have been given"
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of the existing resource group.  Required if not creating new resource group"
  default     = null
}
##############################################################################
