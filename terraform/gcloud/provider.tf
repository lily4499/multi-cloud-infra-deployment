provider "google" {
  credentials = file(var.google_credentials_file)
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


