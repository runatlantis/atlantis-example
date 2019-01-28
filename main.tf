// Provider specific configs
variable "alicloud_access_key" {
  default = ""
}

variable "alicloud_secret_key" {
  default = ""
}

provider "alicloud" {
  access_key = "${var.alicloud_access_key}"
  secret_key = "${var.alicloud_secret_key}"
  region     = "cn-shanghai"
}

terraform {
  backend "s3" {
    bucket   = "my-test-terraform"
    key      = "atlantis-example/terraform.tfstate"
    region   = "cn-shanghai"
    endpoint = "https://oss-cn-shanghai.aliyuncs.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

resource "null_resource" "example" {
}
