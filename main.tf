provider "aws" {
  version = "~> 2.22"
  region = "us-east-1"
  profile = "sandbox"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  name_regex = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"
}

output "ami" {
  value = data.aws_ami.ubuntu.id
}
