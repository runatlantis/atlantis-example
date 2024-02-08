resource "null_resource" "production" {}

module "common" {
  source = "../../modules/common"
}