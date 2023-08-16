# locals {
#   test_var = jsondecode(file("${path.module}/dev_test/var_test.json"))
# }


#locals {
#  account_id = data.aws_caller_identity.current.account_id
# }

# data "shell_script" "pipeline" {
#     lifecycle_commands {
#         create = file("${path.module}/file.sh")
#         # read   = file("${path.module}/scripts/read.sh")
#         # update = file("${path.module}/scripts/update.sh")
#         # delete = file("${path.module}/scripts/delete.sh")
#     }
# }

#module "s3_setup_m" {
#  source = "./modules/s3_m"
  # bucket_prefix_name = "${local.test_var.bucket_prefix_name}"
#  bucket_prefix_name =  var.bucket_prefix_name
 # account_id = local.account_id
 # }

# module "dynamodb_setup" {
#   source = "./modules/dynamodb_table"
#   dynamodb_prefix_name = module.var_names.data_variables.dynamodb_prefix_name
#   account_id = local.account_id
# }

# module "dynamodbitem_setup" {
#   source = "./modules/dynamodb_item"
#   dynamodbitem_prefix_name = module.var_names.data_variables.dynamodbitem_prefix_name
#   account_id = local.account_id
# }
