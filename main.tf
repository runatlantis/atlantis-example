// Configure the Google Cloud provider
provider "google" {
 credentials = file("/tmp/CREDENTIALS_FILE.json")
 project     = "heroic-muse-289316"
 region      = "us-west1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

