# resource "aws_s3_bucket" "b" {
#   bucket = "yan-tf-test-bucket-1"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

resource "aws_s3_bucket" "d" {
  bucket = "yan-tf-test-bucket-2"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}