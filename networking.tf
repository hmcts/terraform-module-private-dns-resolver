resource "azurerm_virtual_network" "resolver" {
  name                = "${var.name}-vnet-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.inbound_ip_prefix, var.outbound_ip_prefix]
}

resource "azurerm_subnet" "inbound" {
  name                 = "${var.name}-inbound-${var.env}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.resolver.name
  address_prefixes     = [var.inbound_ip_prefix]
}

resource "azurerm_subnet" "outbound" {
  name                 = "${var.name}-outbound-${var.env}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.resolver.name
  address_prefixes     = [var.outbound_ip_prefix]
}
