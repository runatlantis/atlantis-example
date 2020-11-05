provider "azurerm" {
  version = "=2.20.0"
  features {}
}

resource "azurerm_resource_group" "main_rg" {
  name     = local.rg_name
  location = var.location
}