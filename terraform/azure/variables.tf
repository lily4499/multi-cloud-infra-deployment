# Define variables for the Terraform configuration

variable "resource_group" {
  description = "Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "East US"
}


#VM


variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "The VM size for the free tier"
  type        = string
  default     = "Standard_B1s"  # Free tier eligible VM size
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
  default     = "18.04-LTS"  # Adjust as necessary for free-tier image availability
}



#ACR


variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"  # Free tier eligible ACR SKU
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled for ACR"
  type        = bool
  default     = true
}



#AKS


variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "The VM size for the nodes in the AKS cluster"
  type        = string
  default     = "Standard_B2s"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the AKS cluster"
  type        = string
  default     = "1.23.5"
}



