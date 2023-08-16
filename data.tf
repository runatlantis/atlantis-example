terraform {
  backend "s3" {
  bucket = "testdev1"
  key = "backend/folder1/dev/main2.tfsate"
  #region = "${var.aws_region}"
    
  }
} 