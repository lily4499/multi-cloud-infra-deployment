# Main Terraform configuration for using modules

provider "google" {
  project = var.project
  region  = var.region
}

# GKE Cluster Module
module "gke" {
  source        = "../../modules/gke_cluster"
  cluster_name  = var.gke_cluster_name
  node_count    = var.node_count
  machine_type  = var.machine_type
}

# GCR (Configured with `terraform.tfvars` for authentication)
