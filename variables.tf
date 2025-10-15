##############################################################################
# Input Variables
##############################################################################

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create. Required if not using existing resource group"
  default     = null
  validation {
    condition     = !(var.resource_group_name != null && var.existing_resource_group_name != null)
    error_message = "only 'resource_group_name' or 'existing_resource_group_name' can be given, but both have been given"
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of an existing resource group. When set to `null`, `default` or `Default` the accounts default resource group is returned."
  default     = null
}
##############################################################################
