#Input variables
#Aws Variable
variable "aws_region" {
    description="Region in which Aws resource is to be created"
    type = string
    default = "ap-southeast-2"
}

#Instance Type
variable "Instance_type" {
    description = "Type of ec2 instance"
    type = string
    default = "t3.micro"
}


#key pair
variable "key_pair" {
    description = "ec2 key pair"
    type = string
    default = "terrform-demo"
  
}