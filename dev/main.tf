provider "aws" {
  region = "us-east-2"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
#  subnet_cidr = "192.168.1.0/24"
#  ENV = "dev"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ENV = "dev"
  ec2_count     = 1
  ami_id        = "ami-0d8f6eb4f641ef691"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
  vpc_id = "${module.my_vpc.vpc_id}"
#  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
