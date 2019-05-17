provider "aws" {
  access_key = "AKIAJXBAZKP6VOQWTJIA"
  secret_key = "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"
  region     = "ap-south-1"
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClRclwr/6J3f2vNFaxo3Xd6T/Ljm+Vc7lE1QZI3NuamR9FJX4I75fW679Lhzl7hRNPm7BVSIFE3bkjGF2zdJKAqYXF/0UTY6EcCO3v6KMooTFeI4d2KyaJn6ZRy1eL6jR49eOzm6VKXgGkOKw5E4g6d+r2jSP7GEcGmayD1mAYrI6xyqLLm5WF+Kxb78a8WIhZQP7Yo2LrvBx7EL/lMMnlztNaDCHs7cKTublSFW+HlsJ+J2GDF2Ss+nUbcyNvqbNdCWFo5ji0sOo01L7YpL0K2ORmj/bcRTqcEcR+Eq6dRiW3Awkc9JtKwL8WmdQK06ArXYHUCf3YPax85CHoHNFH karthick selvam@KarthickSelvam"
}
resource "aws_instance" "example" {
  ami           = "ami-5b673c34"
  instance_type = "t2.micro"
  key_name = "deployer-key"
}
