provider "aws" {
  access_key = "AKIAIGDHFBZPTWRJGPPQ"
  secret_key = "nMZ0Ciz1ZWw5vNO82FO7LZ5jOT1378rW8AWACLFI"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
}
