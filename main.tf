variable "environment_list" {
  description = "Environment ID"
  type = "list"
  default = ["dev", "qa", "prod"]
}
variable "env" {
  default = "test"
  description = "Which environment do you want (options: dev, qa, prod):"
}
resource "null_resource" "is_environment_name_valid" {
  count = "${contains(var.environment_list, var.env) == true ? 0 : 1}"
  "ERROR: The env value can only be: dev, qa or prod" = true
}
