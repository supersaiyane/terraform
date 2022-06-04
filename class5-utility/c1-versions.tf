# Terraform Block
terraform {
  required_version = "~>1.2.2"
   required_providers {
     aws = {
         source = "hashicorp/aws"
         version = "~>3.0"
     }
   }
}

# Provider Block
provider "aws" {
  region = "ap-southeast-2"
}
