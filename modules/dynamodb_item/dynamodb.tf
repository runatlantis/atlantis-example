
resource "aws_dynamodb_table_item" "dynamodb_test" {
    table_name = "test_${var.dynamodbitem_prefix_name}_${var.account_id}_first"
    hash_key = "pipeline"
    item = jsonencode(local.json_tmp)
}

