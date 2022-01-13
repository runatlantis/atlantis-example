# resource "aws_s3_bucket" "tf_course" {
#     bucket = "hella-buckets-21321312312"
#     acl = "private"
# }

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "hella-buckets-21321312312"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name = "terraform-state-lock-dynamo"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20
 
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }