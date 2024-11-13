
#GCE

# Project ID of your Google Cloud project
project_id = "dev-demo-pro"

# Region and zone for the GCE instance
region = "us-central1"
zone   = "us-central1-a"

# Instance configurations
instance_name = "free-tier-instance"
machine_type  = "f1-micro"          # Free-tier eligible machine type
disk_size_gb  = 10                  # Free-tier eligible disk size

# Image for the GCE instance (e.g., Debian)
image = "debian-cloud/debian-11"

# Network configurations
network    = "default"
subnetwork = null                   # Can specify if using custom subnet


#GCR

location   = "us"
repository = "gcr-container-repo"


#GKE

cluster_name   = "gke-cluster"
node_count     = 1
machine_type_gke   = "e2-medium"
min_node_count = 1
max_node_count = 3
