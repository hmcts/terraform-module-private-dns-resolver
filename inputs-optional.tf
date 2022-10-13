variable "existing_resource_group_name" {
  description = "Name of existing resource group to deploy resources into"
  type        = string
  default     = null
}

variable "location" {
  description = "Target Azure location to deploy the resource"
  type        = string
  default     = "uksouth"
}

variable "name" {
  default     = ""
  description = "The name of the Private DNS Resolver"
}
