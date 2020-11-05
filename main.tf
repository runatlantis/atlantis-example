resource "azurerm_resource_group" "main_rg" {
  name     = local.rg_name
  location = var.location
}
