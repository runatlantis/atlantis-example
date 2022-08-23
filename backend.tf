terraform {
backend "gcs" {
  bucket = "terraform-states-i26ef9dii9zscrxrecql6kl8eguw2"   # GCS bucket name to store terraform tfstate
  prefix = "atlantis"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}