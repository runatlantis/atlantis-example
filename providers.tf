terraform {
  required_version = ">= 1.2.0"

  required_providers {
    curl = {
      source  = "marcofranssen/curl"
      version = "0.6.1"
    }
  }
}
