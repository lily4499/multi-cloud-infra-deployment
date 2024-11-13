# Main Terraform configuration for using modules



# azure_VM

module "azure_vm" {
  source           = "../../modules/vm"
  resource_group   = var.resource_group
  location         = var.location
  admin_username   = var.admin_username
  admin_password   = var.admin_password
  vm_size          = var.vm_size
  image_publisher  = var.image_publisher
  image_offer      = var.image_offer
  image_sku        = var.image_sku
}


# ACR Registry
module "azure_acr" {
  source            = "../../modules/acr"
  resource_group    = var.resource_group
  location          = var.location
  acr_name          = var.acr_name
  sku               = var.sku
  admin_enabled     = var.admin_enabled
}


# AKS Cluster Module
module "azure_aks" {
  source              = "../../modules/aks"
  resource_group    = var.resource_group
  location          = var.location
  aks_cluster_name  = var.aks_cluster_name
  node_count        = var.node_count
  node_vm_size      = var.node_vm_size
  dns_prefix        = var.dns_prefix
  kubernetes_version = var.kubernetes_version
 
}

