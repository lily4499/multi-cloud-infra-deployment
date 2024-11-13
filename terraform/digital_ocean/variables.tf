# Define variables for the Terraform configuration

#variable "do_token" {
#  description = "DigitalOcean API token"
#  type        = string
#}

variable "region" {
  description = "Region to deploy the Droplets in"
  type        = string
  default     = "nyc3"
}




variable "droplet_name" {
  description = "Name prefix for the Droplets"
  type        = string
  default     = "my-droplet"
}

variable "size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "Droplet image"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "droplet_count" {
  description = "Number of Droplets to create"
  type        = number
  default     = 1
}






variable "registry_name" {
  description = "Name of the DigitalOcean Container Registry"
  type        = string
  default     = "my-registry"
}

variable "subscription_tier_slug" {
  description = "Subscription tier slug for the registry (can be 'starter' or other tiers)"
  type        = string
  default     = "starter"
}







variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "my-k8s-cluster"
}


variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "default-pool"
}

variable "node_count" {
  description = "Number of nodes in the pool"
  type        = number
  default     = 3
}

variable "node_size" {
  description = "Droplet size for each node"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "kubernetes_version" {
  description = "DigitalOcean Kubernetes version"
  type        = string
  default     = "1.22.8-do.0"  # Adjust based on available versions
}

variable "tags" {
  description = "Tags for the cluster"
  type        = list(string)
  default     = ["k8s", "production"]
}
