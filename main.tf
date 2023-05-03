provider "aws"{
  profile="default"
  region="us-east-1"
  }
resource "null_resource" "example" {
}
resource "aws_vpc" "three-tier_vpc" {
  cidr_block = "10.0.0.0/16"
}
