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

#ec2instance type - list
variable "Instance_type_list" {
    description = "instance type list"
    type = list(string)
    default = [ "t3.micro","t3.small" , "t3.large"]
  
}

#ec2instance type - map
variable "Instance_type_map" {
     description = "instance type map"
     type = map(string)
     default = {
       "dev" = "t3.micro"
       "qa" = "t3.small"
       "prod" = "t3.large"
     }
  
}