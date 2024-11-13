resource "google_storage_bucket" "gcr_bucket" {
  name     = "${var.project_id}-artifacts"
  location = var.location
  project  = var.project_id

  uniform_bucket_level_access = true
  force_destroy               = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

# Grant storage.admin role to the Google Cloud service account used by GCR
resource "google_project_iam_member" "gcr_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:service-${var.project_id}@containerregistry.iam.gserviceaccount.com"
}
