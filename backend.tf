# data "terraform_remote_state" "pipeline1" {
#   backend="s3" 
#   config = {
#     bucket = "testdev1"
#     key = "backend/folder1/${var.env}/main1.tfsate"
#     region = "${var.aws_region}"
    
#   }
# } 