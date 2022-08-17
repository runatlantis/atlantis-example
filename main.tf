resource "null_resource" "example" {
}
resource "aws_s3_bucket" "demos3" {
    bucket = "dummy-check-atlantis"
}