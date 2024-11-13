variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "location" {
  description = "Location for the Artifact Registry repository (e.g., us-central1)"
  type        = string
}

variable "repository" {
  description = "Name of the Artifact Registry repository"
  type        = string
}

variable "repository_format" {
  description = "Format of the repository (e.g., docker, maven, npm)"
  type        = string
}
