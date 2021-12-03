provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "cortex-tfstate-operacoes"
    key    = "env:/development/s3/atlantis-terraform"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "lmb4-my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
