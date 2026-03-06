##############################################################################
# Input Variables
##############################################################################

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create. Required if not using existing resource group"
  default     = null
  validation {
    condition     = !(var.resource_group_name != null && (var.existing_resource_group_name != null || var.existing_resource_group_id != null))
    error_message = "only 'resource_group_name' or 'existing_resource_group_name' or 'existing_resource_group_id' can be given"
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "Name of an existing resource group. When set to `null`, `default` or `Default` the accounts default resource group is returned."
  default     = null
  validation {
    condition     = !(var.existing_resource_group_name != null && var.existing_resource_group_id != null)
    error_message = "only 'existing_resource_group_name' or 'existing_resource_group_id' can be given, but both have been given"
  }
}

variable "existing_resource_group_id" {
  type        = string
  description = "ID of an existing resource group. When set to `null` the module will use `existing_resource_group_name` or the accounts default resource group."
  default     = null
}
##############################################################################
