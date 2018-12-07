variable "profile" {}
variable "shared_credentials_file" {}
variable "environment" {}
variable "account_id" {}


module "common_main_resources-va6" {
  source = "../../modules/example"

  profile                 = "${var.profile}"
  shared_credentials_file = "${var.shared_credentials_file}"
  environment             = "${var.environment}"
  region                  = "us-east-1"
  account_id              = "${var.account_id}"
}
