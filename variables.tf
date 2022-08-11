##############################################################################
# Input Variables
##############################################################################

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create. Required if not using existing resource group"
  default     = null
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of the existing resource group.  Required if not creating new resource group"
  default     = null
}
##############################################################################
