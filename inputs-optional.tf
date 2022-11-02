variable "existing_resource_group_name" {
  description = "Name of existing resource group to deploy resources into"
  type        = string
  default     = null
}

variable "existing_vnet_name" {
  description = "Name of existing vnet"
  type        = string
  default     = null
}

variable "existing_vnet_resource_group" {
  description = "Name of existing resource group containing the vnet"
  type        = string
  default     = null
}

variable "location" {
  description = "Target Azure location to deploy the resource"
  type        = string
  default     = "uksouth"
}

