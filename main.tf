resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo $FOO $BAR $BAZ >> env_vars.txt"
}
}
