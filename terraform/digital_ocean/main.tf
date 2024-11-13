# Main Terraform configuration for using modules

provider "digitalocean" {
  token = var.do_token
}

# DigitalOcean Kubernetes (DOK8s) Module
module "dok8s" {
  source        = "../../modules/dok8s_cluster"
  cluster_name  = var.dok8s_cluster_name
  node_count    = var.node_count
  node_size     = var.node_size
}

# DigitalOcean Container Registry
resource "digitalocean_container_registry" "do_registry" {
  name = var.do_registry_name
}
