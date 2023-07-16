terraform {
  source = "./../../modules"
}

locals {
  env = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.environment
}

inputs = {
  text = "Hello ${local.env}"
}
