variable "vpc_id" {
  type = string
  default = "vpc-5cb89c39"  # bargain
}

variable "subnet_id" {
  type = string
  default = "subnet-a57877d2"  # bargain az-a private
}

variable "ssh_gw_sg_id" {
  type = string
  default = "sg-75830111"  # ssh-gw
}

variable "rproxy_sg" {
  type = string
  default = "sg-7a07191e"  # rproxy-internal2
}

variable "atlantis_port" {
  type = number
  default = 4141
}

variable "iam_instance_profile" {
  type = string
  default = "ec2-atlantis"
}

locals {
  project = "atlantis"
}
