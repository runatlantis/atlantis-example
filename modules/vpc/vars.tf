variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "vpc_id" {}

variable "main-public-1_cidr" {
  default = "10.0.1.0/24"
}
variable "main-public-2_cidr" {
  default = "10.0.2.0/24"
}
variable "main-public-3_cidr" {
  default = "10.0.3.0/24"
}

variable "main-private-1_cidr" {
  default = "10.0.4.0/24"
}

variable "main-private-2_cidr" {
  default = "10.0.5.0/24"
}

variable "main-private-3_cidr" {
  default = "10.0.6.0/24"
}

variable "availability_zones" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}

