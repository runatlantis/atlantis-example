resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.bucket_name}"
  acl           = "private"
  force_destroy = true
}
