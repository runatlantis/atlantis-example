module "test1" {
    source = "./../../modules/s3_m"  
    bucket_prefix_name = var.bucket_prefix_name
    ##account_id = local.account_id
    aws_region = var.aws_region
    profile_name = var.profile_name
    }

module "test2" {
    source = "./../../modules/s3_m2"  
    bucket_prefix_name = var.bucket_prefix_name
    ##account_id = local.account_id
    aws_region = var.aws_region
    profile_name       = var.profile_name
}