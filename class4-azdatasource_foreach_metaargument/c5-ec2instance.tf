# Availability Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


#resource Block
resource "aws_instance" "ec2-demo" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.Instance_type
    #instance_type = var.Instance_type_list[1]
    #instance_type = var.Instance_type_map["prod"]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_pair
    for_each = toset(data.aws_availability_zones.my_azones.names)
    availability_zone = each.key
    vpc_security_group_ids = [ 
        aws_security_group.vpc-ssh.id,
        aws_security_group.vpc-web.id
     ] 
    tags = {
      "Name" = "ec2-terraform-${each.key}"
    } 
}
