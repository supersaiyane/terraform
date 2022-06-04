#aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table
#datasource1
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

#datasource2
data "aws_ec2_instance_type_offerings" "instances_show_v3" {
    for_each = toset(data.aws_availability_zones.my_azones.names)
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

# Basic Output: All Availability Zones mapped to Supported Instance Types
output "output_v3_1" {
 value = { for az, details in data.aws_ec2_instance_type_offerings.instances_show_v3 :
  az => details.instance_types }   
}

# Filtered Output: Exclude Unsupported Availability Zones
output "output_v3_2" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.instances_show_v3 :
  az => details.instance_types if length(details.instance_types) != 0 }
}

# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "output_v3_3" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.instances_show_v3 :
  az => details.instance_types if length(details.instance_types) != 0 }) 
}

# Filtered Output: As the output is list now, get the first item from list (just for learning)
output "output_v3_4" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.instances_show_v3 :
  az => details.instance_types if length(details.instance_types) != 0 })[0]
}
