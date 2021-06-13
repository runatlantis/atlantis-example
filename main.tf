resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'HI'  >> env_vars.txt"
}
}
