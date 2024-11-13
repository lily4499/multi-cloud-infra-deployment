terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}



resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.kubernetes_version

  node_pool {
    name  = var.node_pool_name
    size  = var.node_size
    node_count = var.node_count  # Specify the number of nodes here
    tags  = var.tags
  }
}



