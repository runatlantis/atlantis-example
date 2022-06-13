resource "null_resource" "example" {
}


resource "null_resource" "example2" {
}

resource "null_resource" "example3" {
}

resource "null_resource" "example4" {
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}

provider "aws" {
  # Configuration options
}