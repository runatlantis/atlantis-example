provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "cortex-tfstate-operacoes"
    key    = "env:/development/s3/atlantis-terraform"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "lmb9-my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-078cbb92727dec530"
  instance_type          = "t3a.micro"
  key_name               = "cortex-operacoes"
  monitoring             = true
  vpc_security_group_ids = ["sg-039e93481645626c7"]
  subnet_id              = "subnet-09ad30a977b2366cf"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
