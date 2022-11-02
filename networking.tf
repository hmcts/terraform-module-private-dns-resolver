resource "azurerm_virtual_network" "new" {
  count = var.existing_vnet_name == null ? 1 : 0

  name                = "${var.name}-vnet-${var.env}"
  resource_group_name = local.resource_group
  location            = local.location
  address_space       = [var.inbound_ip_prefix, var.outbound_ip_prefix]
  tags                = module.ctags.common_tags
}

data "azurerm_virtual_network" "existing" {
  count = var.existing_vnet_name == null ? 0 : 1

  name                = var.existing_vnet_name
  resource_group_name = var.existing_resource_group_name
}

resource "azurerm_subnet" "inbound" {
  name                 = "${var.name}-inbound-${var.env}"
  resource_group_name  = local.vnet_resource_group
  virtual_network_name = local.vnet_name
  address_prefixes     = [var.inbound_ip_prefix]

  lifecycle {
    ignore_changes = [
      delegation
    ]
  }
}

resource "azurerm_subnet" "outbound" {
  name                 = "${var.name}-outbound-${var.env}"
  resource_group_name  = local.vnet_resource_group
  virtual_network_name = local.vnet_name
  address_prefixes     = [var.outbound_ip_prefix]

  lifecycle {
    ignore_changes = [
      delegation
    ]
  }
}

# Add vNet peering between new DNS vNET and hub vNET

resource "azurerm_virtual_network_peering" "dnsvnet" {
  name                      = "peerdnsvnetto-${var.env}hub"
  resource_group_name       = local.vnet_resource_group
  virtual_network_name      = local.vnet_name
  remote_virtual_network_id = var.hub_vnet_id
}

resource "azurerm_virtual_network_peering" "hubvnet" {
  name                      = "peer${var.env}hubvnetto-dnsvnet"
  resource_group_name       = var.hub_resource_group
  virtual_network_name      = var.existing_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.new[0].id
}
