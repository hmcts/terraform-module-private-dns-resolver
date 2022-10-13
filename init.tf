terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.26.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}