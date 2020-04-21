provider "template" {
}

resource "template_dir" "config" {
  source_dir      = "/root/demo/instance_config_templates"
  destination_dir = "/root/demo/instance_config2-test"
}

