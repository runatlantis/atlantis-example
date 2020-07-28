provider “aws” {
  profile = “default”
  region  = “us-east-1”
  access_key = “AKIAJV2IN57JDJPIDTOQ”
  secret_key =  “JOx0TW3zZPkLSSi3wbwYYibvM5Uh04ZBVRurDWX9”
}
resource “aws_instance” “example” {
  ami           = “ami-2757f631"
  instance_type = “t2.micro”
}
