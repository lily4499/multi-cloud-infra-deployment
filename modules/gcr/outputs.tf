output "repository_url" {
  description = "URL for the GCR repository"
  value       = "gcr.io/${var.project_id}/${var.repository}"
}
