module "ctags" {
  source = "github.com/hmcts/terraform-module-common-tags"

  builtFrom   = var.builtFrom
  environment = var.env
  product     = var.product
}

locals {
  resource_group      = var.existing_resource_group_name == null ? azurerm_resource_group.new[0].name : data.azurerm_resource_group.existing[0].name
  resource_group_id   = var.existing_resource_group_name == null ? azurerm_resource_group.new[0].id : data.azurerm_resource_group.existing[0].id
  vnet_resource_group = var.existing_vnet_name == null ? var.existing_resource_group_name == null ? azurerm_resource_group.new[0].name : data.azurerm_resource_group.existing[0].name : var.existing_vnet_resource_group
  location            = var.existing_resource_group_name == null ? azurerm_resource_group.new[0].location : data.azurerm_resource_group.existing[0].location
  vnet_name           = var.existing_vnet_name == null ? azurerm_virtual_network.new[0].name : var.existing_vnet_name
  vnet_id             = var.existing_vnet_name == null ? azurerm_virtual_network.new[0].id : data.azurerm_virtual_network.existing[0].id
}

  
