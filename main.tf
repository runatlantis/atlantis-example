resource "null_resource" "example" {
}

resource "local_file" "foo" {
    content  = "foo!"
    filename = "${path.module}/foo.bar"
}
