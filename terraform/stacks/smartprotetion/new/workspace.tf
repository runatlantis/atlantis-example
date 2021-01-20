# WORKSPACE VARS
locals {
  context_variables = {
    dev = {
      vpc_cidr = "10.10.0.0/16"
    }
    stg = {
      vpc_cidr = "10.2.0.0/16"
    }
    pro = {
      vpc_cidr = "10.3.0.0/16"
    }
  }
}

locals {
  workspaces     = merge(local.context_variables)
  workspace      = merge(local.workspaces[terraform.workspace])
  tags           = merge(var.tags, map("project", var.project), map("environment", terraform.workspace))
  name_prefix    = "${terraform.workspace}-${var.project}"
  azs            = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  public_cidrs   = [cidrsubnet(local.workspace["vpc_cidr"], 8, 1), cidrsubnet(local.workspace["vpc_cidr"], 8, 2)]
  private_cidrs  = concat([cidrsubnet(local.workspace["vpc_cidr"], 8, 11), cidrsubnet(local.workspace["vpc_cidr"], 8, 12)], local.lambda_cidrs)
  lambda_cidrs   = [cidrsubnet(local.workspace["vpc_cidr"], 3, 1), cidrsubnet(local.workspace["vpc_cidr"], 3, 2)]
  database_cidrs = [cidrsubnet(local.workspace["vpc_cidr"], 8, 21), cidrsubnet(local.workspace["vpc_cidr"], 8, 22)]
  peering = {
    vpn = {
      account_id               = "243315382426"
      vpc_id                   = "vpc-0dcf0462972b0e6a8"
      vpc_cidr                 = "172.16.0.0/16"
      region                   = "eu-west-1"
      client_vpn_endpoint_id   = "cvpn-endpoint-0d9b3fddb3776da80"
      client_vpn_target_subnet = "subnet-0e5f27e678c399189"
    },
    ops = {
      account_id          = "202016285298"
      vpc_id              = "vpc-0d9332d70723be0b3"
      vpc_cidr            = "10.0.0.0/16"
      private_route_table = "rtb-05f340b5840b27352"
      region              = "eu-west-1"
    }
    legacy_db = {
      account_id          = "243315382426"
      vpc_id              = "vpc-e9199581"
      vpc_cidr            = "172.31.0.0/16"
      private_route_table = "rtb-b46a13dc"
      region              = "eu-central-1"
    },
    legacy_pre = {
      account_id          = "243315382426"
      vpc_id              = "vpc-02752f84f911412e4"
      vpc_cidr            = "10.20.0.0/16"
      private_route_table = "rtb-08f7306e630ac2488"
      region              = "eu-west-1"
    },
    legacy_pro = {
      account_id          = "243315382426"
      vpc_id              = "vpc-05ecc51c0450051bd"
      vpc_cidr            = "10.30.0.0/16"
      private_route_table = "rtb-053038336962a1b92"
      region              = "eu-west-1"
    },
  }
}
