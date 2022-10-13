data "azurerm_subscription" "current" {
}

data "azurerm_key_vault" "hub_azure_keyvault" {
  name                = var.hub_keyvault_name
  resource_group_name = var.hub_keyvault_resource_group
}

data "azurerm_key_vault_secret" "hub_subnet-inbound-resolver-prefix" {
  name         = "subnet-inbound-resolver-prefix"
  key_vault_id = data.azurerm_key_vault.hub_azure_keyvault.id
}

data "azurerm_key_vault_secret" "hub_subnet-outbound-resolver-prefix" {
  name         = "subnet-outbound-resolver-prefix"
  key_vault_id = data.azurerm_key_vault.hub_azure_keyvault.id
}

module "ctags" {
  source = "github.com/hmcts/terraform-module-common-tags"

  builtFrom   = var.builtFrom
  environment = var.env
  product     = var.product
}
