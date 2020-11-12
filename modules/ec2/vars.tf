variable "ENV" {}
 
variable "ec2_count" {
  default = "1"
}

variable "ami_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_id" {}

variable "subnet_id" {
  default = "aws_subnet.main-public-1.id"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
