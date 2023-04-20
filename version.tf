# Terraform version
terraform {
  required_version = ">= 1.1.2.0, <= 1.1.4.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 2.38.0"
    }
  }
}
