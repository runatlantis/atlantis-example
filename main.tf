resource "null_resource" "is_environment_name_valid" {
  depends_on = [ "${data.aws_route_table.priv}" ]
}
