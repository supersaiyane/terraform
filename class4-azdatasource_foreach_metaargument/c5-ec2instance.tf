#resource Block
resource "aws_instance" "ec2-demo" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.Instance_type
    #instance_type = var.Instance_type_list[1]
    #instance_type = var.Instance_type_map["prod"]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_pair
    # Create EC2 Instance in all Availabilty Zones of a VPC 
    #this does no check if instance type is supported in that az 
    #for_each = toset(data.aws_availability_zones.my_azones.names) 
    #this does check if instance type is supported in that az
    for_each = toset(keys({ for az, details in data.aws_ec2_instance_type_offerings.instances_show_v3 :
  az => details.instance_types if length(details.instance_types) != 0 }))
    availability_zone = each.key
    vpc_security_group_ids = [ 
        aws_security_group.vpc-ssh.id,
        aws_security_group.vpc-web.id
     ] 
    tags = {
      "Name" = "ec2-terraform-${each.key}"
    } 
}
