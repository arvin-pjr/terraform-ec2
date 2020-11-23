provider "aws" {
  region  = var.aws_region
  profile = "arvin"
}

terraform {
  backend "s3" {
    bucket         = "xhibit-tfstate"
    key            = "tfstate/sample/latest.json"
    region         = "us-west-2"
    profile        = "arvin"
    dynamodb_table = "tfstate-lock"
  }
}