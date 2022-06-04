#aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table

data "aws_ec2_instance_type_offerings" "instances_show_v1" {
    filter {
      name = "instance-type"
      values = ["t3.micro"]
    }
    filter {
      name = "location"
      values = ["ap-souteast-2a"]

    }

    location_type = "availability-zone"
}


#output

output "output_v1_list" {
    value = data.aws_ec2_instance_type_offerings.instances_show_v1.instance_types 
}
