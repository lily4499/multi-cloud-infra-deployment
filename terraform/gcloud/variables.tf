variable "project" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

