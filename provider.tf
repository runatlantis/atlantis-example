provider "aws" {
  region  = "us-east-1"
  version = "~> 1.57"
}

provider "template" {
  version = "~> 1.0"
}

terraform {
  required_version = ">= 0.11.11"

  backend "s3" {
    bucket = "nevi-terraform-remote"

    # IMPORTANT This key is only for the foundation module
    key     = "state/atlantis"
    region  = "us-east-1"
    encrypt = true
  }
}

