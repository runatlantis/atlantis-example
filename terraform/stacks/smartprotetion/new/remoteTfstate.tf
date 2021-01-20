terraform {
  required_version = "= 0.14.4"

  backend "s3" {
    bucket               = "sp-sre-terraform"
    region               = "eu-west-1"
    encrypt              = true
    key                  = "terraform.tfstate"
    workspace_key_prefix = "smart/new"
    profile = "devops-ops-admin"
  }
}
