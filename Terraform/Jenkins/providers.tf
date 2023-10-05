terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    shared_config_files      = ["/home/shubham797/.aws/config"]
    shared_credentials_files = ["/home/shubham797/.aws/credentials"]
    region = var.aws_region
}