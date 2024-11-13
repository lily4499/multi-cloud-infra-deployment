variable "instance_name" {
  description = "Name of the GCE instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the GCE instance"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of the boot disk in GB"
  type        = number
}

variable "image" {
  description = "Image for the GCE instance"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name (optional)"
  type        = string
  default     = null
}

variable "zone" {
  description = "Zone for the GCE instance"
  type        = string
}
