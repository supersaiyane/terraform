#terraform output values

#ec2 instance public dns
output "for_output_list" {
  description = "for loop in list"
  value = [for instance in  aws_instance.ec2-demo: instance.public_dns]
}


#ec2 instance public dns
output "for_output_map" {
  description = "for loop in map"
  value = {
    for c, instance in aws_instance.ec2-demo: c => instance.public_dns}
  }

# Output Legacy Splat Operator (latest) - Returns the List
/*
output "output_splat_legacy" {
  description = "legacy splat output"
  value = aws_instance.ec2-demo.*.public_dns
}
*/

# Output Latest Generalized Splat Operator - Returns the List

output "output_generalized_splat" {
  description = "latest  Generalized splat output"
  value = aws_instance.ec2-demo[*].public_dns
}