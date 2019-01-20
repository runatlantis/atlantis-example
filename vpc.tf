resource "aws_vpc" "grabwack-vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "Grabwack VPC"
  }
}
