
terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = "~> 2.0"
  }
}

provider "aws" {
  version    = "~> 2.0"
  region     = "eu-west-3"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "test" {
  bucket = "${var.group}-dev-esgi"
  acl    = "private"

  tags = {
    environment = "dev"
    group       = var.group
  }
}
