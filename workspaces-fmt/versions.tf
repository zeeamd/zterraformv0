## Specify the version constraints for terraform and providers

terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }
}
