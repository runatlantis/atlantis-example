resource "null_resource" "example" {}

provider "aws" {
    version = "~> 2.0"
    region  = "eu-central-1"
    profile = "asaf-aws-sandbox"
}

terraform {
    beckend "s3" {
        bucket = "asaf-vault-acct-tfstate"
        key    = "test-atlantis.tfstate"
        region = "eu-central-1"
        profile = "asaf-aws-sandbox"
    }

    required_version = ">=0.11"
}
