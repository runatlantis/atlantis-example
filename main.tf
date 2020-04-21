provider "template" {
}

resource "template_dir" "config" {
  source_dir      = "/root/demo/instance_config_templates"
  destination_dir = "/root/demo/instance_config2-test"
}


resource "template_dir" "config2" {
  source_dir      = "/root/demo/instance_config_templates"
  destination_dir = "/root/demo/instance_config2-test2"
}

resource "template_dir" "config3" {
  source_dir      = "/root/demo/instance_config_templates"
  destination_dir = "/root/demo/instance_config2-test3"
}


