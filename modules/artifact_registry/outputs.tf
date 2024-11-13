output "repository_url" {
  description = "URL for the Artifact Registry repository"
  value       = "https://${var.location}-docker.pkg.dev/${var.project_id}/${var.repository}"
}
