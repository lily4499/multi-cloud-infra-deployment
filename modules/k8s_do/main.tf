resource "digitalocean_kubernetes_cluster" "this" {
  name               = var.cluster_name
  region             = var.region
  version            = var.kubernetes_version
  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    count      = var.node_count
    tags       = var.tags
  }
}


