variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the AKS cluster"
}

variable "aks_cluster_name" {
  type        = string
  default     = "aks-cluster"
  description = "Name of the AKS cluster"
}

variable "aks_dns_prefix" {
  type        = string
  default     = "aks-cluster-dns"
  description = "DNS prefix of the AKS cluster"
}

variable "aks_node_count" {
  type        = number
  default     = 1
  description = "Number of nodes in the AKS cluster"
}

variable "aks_node_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "Size of the VMs in the AKS cluster"
}

variable "aks_node_pool_name" {
  type        = string
  default     = "default"
  description = "Name of the node pool in the AKS cluster"
}

variable "aks_os_disk_size_gb" {
  type        = number
  default     = 30
  description = "Size of the OS disk in the AKS cluster"
}

variable "aks_service_principal_id" {
  type        = string
  default     = "a0a0a0a0-a0a0-a0a0-a0a0-a0a0a0a0a0a0"
  description = "Service principal ID for the AKS cluster"
}

variable "aks_service_principal_secret" {
  type        = string
  default     = "a0a0a0a0-a0a0-a0a0-a0a0-a0a0a0a0a0a0"
  description = "Service principal secret for the AKS cluster"
}