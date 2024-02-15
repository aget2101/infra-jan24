terraform {
  backend "s3" {
    bucket = "abreham-terraform-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-west-2"
    dynamo_table = "terraform-state"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}
