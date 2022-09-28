terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.29.0"
    }
  }
}

variable "ami" {
  type = string
  description = "ami id"
  default = "ami-00b696228b0185ffe"
}

resource "aws_instance" "my-instance12" {
  ami                    = var.ami  # ami-09042b2f6d07d164a
  instance_type          = "t2.micro"
  tags = {
    Name = "my_custom_server1"
  }
}
