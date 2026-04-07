terraform {
  required_version = ">= 1.0"
}
provider "local" {}

resource "local_file" "example" {
  filename = "test.txt"
  content  = "Hello Atlantis"
}