resource "null_resource" "staging" {}
resource "null_resource" "staging-1" {}

module "common" {
  source = "../../modules/common"
}