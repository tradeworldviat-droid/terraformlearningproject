terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "<=4.0"
    }
  }
}
#below code will fix region permanantly
provider "aws" {
      region = "ap-south-1"
}