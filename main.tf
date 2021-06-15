provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "test" {
  ami           = "ami-0f9ae750e8274075b"
  instance_type = "t2.micro"
}
