resource "null_resource" "example_terraform" {}

module foo {
  source = "../../../modules/terraform/foo"
}
