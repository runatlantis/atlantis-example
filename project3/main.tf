module "module2" {
  source  = "../modules/module2"
  message = "${var.message}"
}