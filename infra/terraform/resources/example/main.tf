terraform {
  backend "s3" {
    bucket               = "mojap-atlantis-terraform-test"
    workspace_key_prefix = "example:"
    key                  = "terraform.tfstate"
    region               = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 1.50"
}

// module "s3" {
//   source = "../../modules/s3_bucket"


//   bucket_name = "mojap-atlantis-test-bucket"
// }
