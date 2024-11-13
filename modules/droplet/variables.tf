variable "droplet_name" {
  description = "Prefix for droplet names"
  type        = string
}

variable "region" {
  description = "Region to deploy the Droplets in"
  type        = string
}

variable "size" {
  description = "Droplet size"
  type        = string
}

variable "image" {
  description = "Image to use for the Droplets"
  type        = string
}

variable "droplet_count" {
  description = "Number of Droplets to create"
  type        = number
}

variable "ssh_keys" {
  description = "List of SSH keys to attach to the Droplets"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "List of tags to assign to the Droplets"
  type        = list(string)
  default     = []
}
