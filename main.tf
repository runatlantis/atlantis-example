resource "null_resource" "example" {
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "atlantis-test"
}
