variable "env" {
  description = "Environment value."
  type        = string
}

variable "name" {
  description = "The name of the Private DNS Resolver"
  type        = string
}
variable "inbound_ip_prefix" {
  description = "The IP prefix for the inbound resolver."
  type        = string
}

variable "outbound_ip_prefix" {
  description = "The IP prefix for the outbound resolver."
  type        = string
}

variable "product" {
  description = "https://hmcts.github.io/glossary/#product"
  type        = string
}

variable "builtFrom" {
  description = "The URL of the repository from which the module is built."
  type        = string
}

variable "hub_vnet_name" {
  description = "The name of the environment's hub vNet"
  type        = string
}

variable "hub_vnet_id" {
  description = "The ID of the environment's hub vNet"
  type        = string
}

variable "hub_resource_group" {
  description = "The name of the RG hosting the hub vNet"
  type        = string
}

variable "palo_alto_lb_ip" {
  description = "The IP address of the Palo Alto load balancer"
  type        = string
}

variable "rules" {
  description = "The rules to be applied to the resolver."
  type = list(object({
    name        = string
    domain_name = string
    target_dns_servers = list(object({
      use_resolver_inbound_address = bool
      ip_address                   = string
      port                         = number
    }))
    enabled = bool
  }))
}

variable "dns_zone_vnets" {
  description = "The IDs and Names of the VNets to link to the private DNS Resolver. These VNets should be linked to private dns zones."
  type = list(object({
    name = string
    id   = string
  }))
}
