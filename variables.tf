
variable "aws_region" {
    default = "us-east-1"
}

variable "profile_name" { default = "dev" }
variable "dynamodbitem_prefix_name" {}
variable "dynamodb_prefix_name" {}
variable "bucket_prefix_name" {}
data "aws_caller_identity" "current" {}

# locals {
#   account_id = data.aws_caller_identity.current.account_id
# }
