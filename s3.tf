resource "aws_s3_bucket" "atlantis-test" {
  bucket = "atlantis-test"

  tags = {
    Name        = "atlantis-test"
    Environment = "Dev"
  }
}
