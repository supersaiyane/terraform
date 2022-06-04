# Terraform Settings Block
terraform {
  //required_version = "value"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
  # for storing terraform state in the remorte resource, by default it stores in local
#   backend "s3" {

    
#   }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-southeast-2"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0c6120f461d6b39e9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}

