resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "this" {
  name                                       = "${var.name}-${var.env}-ruleset"
  resource_group_name                        = local.resource_group
  location                                   = local.location
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.outbound.id]
  tags                                       = module.ctags.common_tags
}

resource "azurerm_private_dns_resolver_virtual_network_link" "this" {
  for_each                  = var.dns_zone_vnets
  name                      = "${each.key}-link"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.this.id
  virtual_network_id        = each.value
}

resource "azurerm_private_dns_resolver_forwarding_rule" "name" {
  for_each                  = var.rules
  name                      = each.key
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.this.id
  domain_name               = each.value.domain_name
  enabled                   = each.value.enabled

  dynamic "target_dns_servers" {
    for_each = each.value.target_dns_servers
    content {
      ip_address = target_dns_servers.value.use_resolver_inbound_address ? azurerm_private_dns_resolver_inbound_endpoint.inbound.ip_configurations[0].private_ip_address : target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }
}
