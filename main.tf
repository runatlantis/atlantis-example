resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-1223"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
