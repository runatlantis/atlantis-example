output "message" {
  value = var.text
}

variable "text" {
  type        = string
  description = "Command definition to execute"
}
