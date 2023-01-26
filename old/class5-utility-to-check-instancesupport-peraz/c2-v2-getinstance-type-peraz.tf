#aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table

data "aws_ec2_instance_type_offerings" "instances_show_v2" {
    for_each = toset([ "ap-southeast-2a", "ap-southeast-2b","ap-southeast-2c"])
    filter {
      name = "instance-type"
      values = ["t3.micro"]
    }
    filter {
      name = "location"
      values = [each.key]

    }

    location_type = "availability-zone"
}


#output

output "output_v2_list" {
    #value = data.aws_ec2_instance_type_offerings.instances_show.instance_types 
    value = [for t in data.aws_ec2_instance_type_offerings.instances_show_v2: t.instance_types]
}

output "output_v2_map" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.instances_show_v2: az => details.instance_types
    }
  
}