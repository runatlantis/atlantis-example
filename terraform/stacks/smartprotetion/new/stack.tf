##########################################
# SP Base Stack
##########################################
#####################
# AWS Provider
#####################





# Main AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "smart-${terraform.workspace}-admin"
}

# Root AWS Provider
provider "aws" {
  region = var.aws_region
  alias  = "root"
}

# OPS AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "devops-ops-admin"
  alias   = "ops"
}

#####################
# Data
#####################

data "aws_availability_zones" "available" {
  state = "available"
}

#####################
# TF Modules
#####################

module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name                 = local.name_prefix
  cidr                 = local.workspace["vpc_cidr"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  azs                    = local.azs
  enable_nat_gateway     = lookup(var.nat_gateway, "enable_nat_gateway", false)
  single_nat_gateway     = lookup(var.nat_gateway, "single_nat_gateway", false)
  one_nat_gateway_per_az = lookup(var.nat_gateway, "one_nat_gateway_per_az", false)

  public_subnets   = local.public_cidrs
  private_subnets  = local.private_cidrs
  database_subnets = local.database_cidrs

  enable_flow_log                      = lookup(var.flow_log, "enable_flow_log", false)
  flow_log_destination_type            = lookup(var.flow_log, "flow_log_destination_type", "cloud-watch-logs")
  create_flow_log_cloudwatch_iam_role  = lookup(var.flow_log, "create_flow_log_cloudwatch_iam_role", false)
  create_flow_log_cloudwatch_log_group = lookup(var.flow_log, "create_flow_log_cloudwatch_log_group", false)
  tags = local.tags
}
