resource "aws_s3_bucket" "aam-atl" {
  bucket = "aam-atl-${var.environment}"
  acl    = "private"

  }

  tags {
    "Adobe:ArchPath"    = "test"
  }
}