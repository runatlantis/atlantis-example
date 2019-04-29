resource "null_resource" "example" {
}

resource "aws_ssm_parameter" "foo" {
    value = "bar"
    overwrite = true
}