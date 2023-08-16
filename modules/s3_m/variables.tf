data "aws_caller_identity" "current" {}

variable "aws_region" {
    default = "us-east-1"
}
variable "profile_name" { default = "dev" }
variable "dynamodbitem_prefix_name" { default="test"}
variable "dynamodb_prefix_name" { default="db1"}
variable "bucket_prefix_name" {default="firsttest"}

#locals {
#  account_id = data.aws_caller_identity.current.account_id
#}

# variable "bucket_prefix_name" {}
# variable "account_id" {}
# variable "aws_region" {}
# variable "profile_name" {}
