resource "azurerm_resource_group" "rg-aks" {
  name     = "aksResourceGroup"
  location = "eastus"
}