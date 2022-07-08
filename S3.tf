#folder structure in varuable needs to be created

#Bucket 1 roche-distill-code-<env>

resource "aws_s3_bucket" "distillcodeBucket" {
  bucket = "roche-distill-code-${var.Environment1}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.KMS_Key
      }
    }
  }

  versioning {
    enabled = false
  }
  tags = {
    Project : "Distill"
  }
}

resource "aws_s3_bucket_public_access_block" "distillcodeBucketAccess" {
  bucket                  = aws_s3_bucket.distillcodeBucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_object" "Distillfolders" {
  count      = length(var.s3_code_folders)
  bucket     = aws_s3_bucket.distillcodeBucket.id
  acl        = "private"
  key        = "${var.s3_code_folders[count.index]}/"
  kms_key_id = var.KMS_Key
  # source = "/dev/null"
}



#Bucket 2 roche-distill-mwaa-<env>

resource "aws_s3_bucket" "distillmwaaBucket" {
  bucket = "roche-distill-mwaa-${var.Environment1}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.KMS_Key
      }
    }
  }

  versioning {
    enabled = false
  }
  tags = {
    Project : "Distill"
  }
}

resource "aws_s3_bucket_public_access_block" "distillmwaaBucketAccess" {
  bucket                  = aws_s3_bucket.distillmwaaBucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_object" "Distillmwaafolders" {
  count      = length(var.s3_mwaa_folders)
  bucket     = aws_s3_bucket.distillmwaaBucket.id
  acl        = "private"
  key        = "${var.s3_mwaa_folders[count.index]}/"
  kms_key_id = var.KMS_Key
  # source = "/dev/null"
}


#Bucket 3 roche-distill-stg-<env>

resource "aws_s3_bucket" "distillstgBucket" {
  bucket = "roche-distill-stg-${var.Environment1}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.KMS_Key
      }
    }
  }

  versioning {
    enabled = false
  }
  tags = {
    Project : "Distill"
  }
}

resource "aws_s3_bucket_public_access_block" "distillstgBucketAccess" {
  bucket                  = aws_s3_bucket.distillstgBucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_object" "DistillStgfolders" {
  count      = length(var.s3_stg_folders)
  bucket     = aws_s3_bucket.distillstgBucket.id
  acl        = "private"
  key        = "${var.s3_stg_folders[count.index]}/"
  kms_key_id = var.KMS_Key
  # source = "/dev/null"
}

#Bucket 4 roche-distill-data-<env>

resource "aws_s3_bucket" "distilldataBucket" {
  bucket = "roche-distill-data-${var.Environment1}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.KMS_Key
      }
    }
  }

  versioning {
    enabled = false
  }
  tags = {
    Project : "Distill"
  }
}

resource "aws_s3_bucket_public_access_block" "distilldataBucketAccess" {
  bucket                  = aws_s3_bucket.distilldataBucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_object" "Distilldatafolders" {
  count      = length(var.s3_data_folders)
  bucket     = aws_s3_bucket.distilldataBucket.id
  acl        = "private"
  key        = "${var.s3_data_folders[count.index]}/"
  kms_key_id = var.KMS_Key
  # source = "/dev/null"
}