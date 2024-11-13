# Main Terraform configuration for using modules

#GCE
module "gce_instance" {
  source        = "../../modules/gce"
  zone          = var.zone 
  instance_name = var.instance_name
  machine_type  = var.machine_type
  disk_size_gb  = var.disk_size_gb
  image         = var.image
  network       = var.network
  subnetwork    = var.subnetwork
}


#GCR

module "gcr" {
  source      = "../../modules/gcr"
  project_id  = var.project_id
  location    = var.location
  repository  = var.repository
}


#GKE

module "gke" {
  source          = "../../modules/gke"
  project_id      = var.project_id
  region          = var.region
  cluster_name    = var.cluster_name
  node_count      = var.node_count
  gke_machine_type    = var.gke_machine_type
  min_node_count  = var.min_node_count
  max_node_count  = var.max_node_count
}























