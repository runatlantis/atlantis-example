

resource "aws_s3_bucket" "s3_buck" {
  bucket = "sg-ps-test1-${var.bucket_prefix_name}-to-be-deleted-today"
}

#resource "aws_s3_bucket" "s3_test_buck" {
#  for_each = fileset("${path.module}/../../Pipelines/SourceClass/", "*")
#  bucket = "sg-${each.value}"
#}
