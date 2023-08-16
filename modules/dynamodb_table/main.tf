
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name = "test_${var.dynamodb_prefix_name}_${var.account_id}_first"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
}