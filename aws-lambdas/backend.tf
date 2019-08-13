terraform {
  backend "s3" {
    region               = "us-east-1"
    bucket               = "258772036713-route53-backup"
    key                  = "terraform.tfstate"
    workspace_key_prefix = "aws-lambdas"
    dynamodb_table       = "terraform_locks"
  }
}
