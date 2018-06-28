provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "example" {
  ami = "ami-03291866"
  instance_type = "t2.micro"
  subnet_id = "subnet-64789728"
  vpc_security_group_ids = ["sg-7bccaf11"]
  key_name = "ChangLab"
}
