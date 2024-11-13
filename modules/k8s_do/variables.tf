variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "Region for the Kubernetes cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the pool"
  type        = number
}

variable "node_size" {
  description = "Droplet size for each node"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster"
  type        = string
}

variable "tags" {
  description = "List of tags to apply to the cluster"
  type        = list(string)
}
