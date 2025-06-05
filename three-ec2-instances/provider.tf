terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }

backend "s3" {
  bucket = "ansible-tf-remote-state"
  key = "three-ec2-instances"
  region = "us-east-1"
  dynamodb_table="ansible-tf-locking"
  }
}
#provide authentication here
provider "aws" {
  # Configuration options
  region = "us-east-1"
}