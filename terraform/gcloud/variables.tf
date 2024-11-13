
variable "google_credentials_file" {
  description = "Path to the Google Cloud credentials file"
  type        = string
  default     = "/var/jenkins_home/google-key-file.json"
}



variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region for the GCE instance"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone for the GCE instance"
  type        = string
  default     = "us-central1-a"
}


#GCE

variable "instance_name" {
  description = "Name of the GCE instance"
  type        = string
  default     = "free-tier-instance"
}

variable "machine_type" {
  description = "Machine type for the GCE instance"
  type        = string
  default     = "f1-micro"
}

variable "disk_size_gb" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 10
}

variable "image" {
  description = "Image for the GCE instance"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork name (optional)"
  type        = string
  default     = null
}




#ARTIFARCT REGISTRY

variable "location" {
  description = "Location for the Artifact Registry repository (e.g., us-central1)"
  type        = string
}

variable "repository_name" {
  description = "Name of the Artifact Registry repository"
  type        = string
  default     = "my-artifact-repo"
}

variable "repository_format" {
  description = "Format of the repository (e.g., docker, maven, npm)"
  type        = string
  default     = "docker"
}


#GKE


variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "node_count" {
  description = "The initial number of nodes for the GKE cluster"
  type        = number
  default     = 1
}

variable "gke_machine_type" {
  description = "Machine type for the GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "min_node_count" {
  description = "Minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes in the node pool"
  type        = number
  default     = 3
}




























