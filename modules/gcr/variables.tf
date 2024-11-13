variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "location" {
  description = "Location for the GCR repository (e.g., us, eu, asia)"
  type        = string
}

variable "repository" {
  description = "Name of the GCR repository"
  type        = string
}
