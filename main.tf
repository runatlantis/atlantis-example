terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.59.0"
    }
  }
  backend "s3" {
    profile        = "sfi-t"
    bucket         = "sfi-t-terraform-state-ap-northeast-1"
    key            = "test-ichihara"
    dynamodb_table = "terraform-state-lock"
    region         = "ap-northeast-1"
    role_arn       = "arn:aws:iam::904629926878:role/cm-common-z-policy-cicd-user"
  }
}

provider "aws" {
  allowed_account_ids = ["904629926878"]
  profile             = "sfi-t"
  region              = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::904629926878:role/cm-common-z-policy-cicd-user"
  }
  default_tags {
    tags = {
      "ManagedBy"   = "terraform"
      "Environment" = "test"
    }
  }
}

resource "null_resource" "example" {
}
resource "null_resource" "my-example3" {
}
