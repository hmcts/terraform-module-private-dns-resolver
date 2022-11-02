resource "azurerm_private_dns_resolver" "resolver" {
  name                = "${var.name}-${var.env}"
  resource_group_name = local.resource_group
  location            = local.location
  virtual_network_id  = local.vnet_id
  tags                = module.ctags.common_tags
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "inbound" {
  name                    = "inbound-endpoint-${var.env}"
  private_dns_resolver_id = azurerm_private_dns_resolver.resolver.id
  location                = local.location
  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = azurerm_subnet.inbound.id
  }
  tags = module.ctags.common_tags
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "outbound" {
  name                    = "outbound-endpoint-${var.env}"
  private_dns_resolver_id = azurerm_private_dns_resolver.resolver.id
  location                = local.location
  subnet_id               = azurerm_subnet.outbound.id
  tags                    = module.ctags.common_tags
}

