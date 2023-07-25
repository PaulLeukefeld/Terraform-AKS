resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.rg_aks.name
  location            = var.location
  sku                 = var.container_registry_sku
}