#resource Block
resource "aws_instance" "ec2-demo" {
    ami = "ami-0c6120f461d6b39e9"
    instance_type = "t3.micro"
    user_data = file("${path.module}/app1-install.sh")
    key_name = "terrform-demo"
    tags = {
      "Name" = "ec2-terraform"
    } 
}
