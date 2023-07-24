resource "azurerm_resource_group" "rg_aks" {
  name     = "aksResourceGroup"
  location = var.location
}