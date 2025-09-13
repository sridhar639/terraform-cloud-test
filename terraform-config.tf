terraform {
  required_version = "~>1.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.11.0"
    }
  }

  backend "s3" {
    bucket = "terraform-test-practice-369"
    key    = "module2/terraform.tfstate"
    region = "us-east-1"

    use_lockfile = true
  }
}

provider "aws" {
  region  = "us-east-1"
}