locals {
  names = ["foo"]
}

resource "null_resource" "example" {
  for_each = local.names
}

output "null_resources" {
  value = null_resource.example.*
}
