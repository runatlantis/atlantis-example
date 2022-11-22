module "module1" {
  source  = "../modules/module1"
  message = "${var.message}"
}