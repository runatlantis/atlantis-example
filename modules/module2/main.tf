resource "null_resource" "example" {
  triggers = {
    message = var.message
  }
}
