terraform {
  backend "s3" {
    bucket = "jz-tfstate"
    key    = "stage"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.56.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "frontend" {
  source = "../modules/website"

  application_name = var.application_name
  environment = var.environment
}