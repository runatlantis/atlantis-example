# Common
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "project" {
  description = "Stack project name"
  type        = string
  default     = "smart"
}

variable "tags" {
  description = "AWS tags for resources"
  type        = map(any)
  default = {
    tf_state  = "new"
    terraform = "true"
  }
}

# VPC
# One NAT Gateway per availability zone
variable "nat_gateway" {
  description = "Number of NAT Gateway in the VPC"
  type        = map(any)
  default = {
    enable_nat_gateway     = true
    single_nat_gateway     = false
    one_nat_gateway_per_az = true
  }
}

variable "flow_log" {
  description = "VPC Flow Log configurartion"
  type        = map(any)
  default = {
    enable_flow_log                      = true
    flow_log_destination_type            = "cloud-watch-logs"
    create_flow_log_cloudwatch_iam_role  = true
    create_flow_log_cloudwatch_log_group = true

  }
}

