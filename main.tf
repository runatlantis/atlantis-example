resource "null_resource" "example" {}

output "workspace" {
  value = terraform.workspace
}