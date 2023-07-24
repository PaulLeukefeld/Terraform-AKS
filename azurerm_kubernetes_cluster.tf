resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-aks.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name            = var.aks_node_pool_name
    node_count      = var.aks_node_count
    vm_size         = var.aks_node_vm_size
    os_disk_size_gb = var.aks_os_disk_size_gb
  }

  service_principal {
    client_id     = var.aks_service_principal_id
    client_secret = var.aks_service_principal_secret
  }

  role_based_access_control_enabled = true
}
