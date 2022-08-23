# Specify the GCP Provider
provider "google" {
project = var.project_id
region  = var.region
}

# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = var.bucket_name
location = var.region
}