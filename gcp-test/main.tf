provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_storage_bucket" "default" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}
