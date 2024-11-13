variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location for the AKS cluster"
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "node_vm_size" {
  description = "The VM size for the nodes in the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the AKS cluster"
  type        = string
}

//variable "client_id" {
//  description = "The Client ID for the Service Principal"
//  type        = string
//}

//variable "client_secret" {
//  description = "The Client Secret for the Service Principal"
//  type        = string
//  sensitive   = true
//}
