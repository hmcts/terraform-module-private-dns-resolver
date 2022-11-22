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

variable "rules" {
  description = "The rules to be applied to the resolver."
  type = map(object({
    domain_name = string
    target_dns_servers = list(object({
      use_resolver_inbound_address = bool
      ip_address                   = string
      port                         = number
    }))
    enabled = bool
  }))
  default = null
}

variable "dns_zone_vnets" {
  description = "The IDs and Names of the VNets to link to the private DNS Resolver. These VNets should be linked to private dns zones."
  type        = map(any)
  default = null
}
