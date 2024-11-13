resource "google_artifact_registry_repository" "artifact_repo" {
  provider = google
  project  = var.project_id
  location = var.location
  repository_id = var.repository
  format   = var.repository_format

  description = "Artifact Registry repository for storing container images or artifacts."
}
