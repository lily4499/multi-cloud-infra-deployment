# Main Terraform configuration for using modules


# Create droplets by calling the module
module "droplets" {
  source       = "../../modules/droplet"
  droplet_name = var.droplet_name
  region       = var.region
  size         = var.size
  image        = var.image
  count        = var.droplet_count
}


# Call the registry module to create a DigitalOcean Container Registry
module "registry" {
  source         = "../../modules/do_registry"
  registry_name  = var.registry_name
  subscription_tier_slug = var.subscription_tier_slug
  region         = var.region
}



# Call the Kubernetes module to create a DigitalOcean Kubernetes cluster
module "dok8s_cluster" {
  source            = "../../modules/k8s_do"
  cluster_name      = var.cluster_name
  region            = var.region
  node_pool_name    = var.node_pool_name
  node_count        = var.node_count
  node_size         = var.node_size
  kubernetes_version = var.kubernetes_version
  tags              = var.tags
}