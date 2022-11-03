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
