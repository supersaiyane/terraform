#resource Block
resource "aws_instance" "ec2-demo" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.Instance_type
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_pair
    vpc_security_group_ids = [ 
        aws_security_group.vpc-ssh.id,
        aws_security_group.vpc-web.id
     ]
    tags = {
      "Name" = "ec2-terraform"
    } 
}
