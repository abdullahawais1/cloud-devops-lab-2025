terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "abdullah-devops"          # your bucket name
    key            = "terraform/state.tfstate"  # path inside bucket
    region         = "eu-north-1"               # match your bucket region
    dynamodb_table = "terraform-locks"          # (if you create DynamoDB table for locking)
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  
}

