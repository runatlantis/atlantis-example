resource "null_resource" "example" {
}

data "aws_vpc" "my_vpc" {
  tags = {
    Name = "clari_org_production"
  }
}

output "my_vpc" {
  value = data.aws_vpc.my_vpc.id
}
