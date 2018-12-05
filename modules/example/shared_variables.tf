// This file is symlinked to several other places, beware when editing!!

// The original location of this file is in the vpc module


variable "environment_name" {
  description = "Environment name for Adobe:Environment tag"

  default = {
    "prod"          = "Production"
    "stage"         = "Stage"
  }
}
