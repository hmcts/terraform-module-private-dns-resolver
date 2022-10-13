resource "azurerm_resource_group" "rg" {
  count = var.existing_resource_group_name == null ? 1 : 0

  name     = "private-dns-resolver-${var.env}"
  location = var.location

  tags = module.ctags.common_tags
}
