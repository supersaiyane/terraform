#terraform output values

# EC2 Instance Public IP with TOSET
output "instance_publicIP" {
  description = "Ec2 Instance Public IP"
  #value = aws_instance.ec2-demo.*.public_ip  #legacy splat
  #value = aws_instance.ec2-demo[*].public_ip  #latest Splat
  value = toset([for ec2-demo in aws_instance.ec2-demo: ec2-demo.public_ip])
}

# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.ec2-demo.*.public_ip  # Legacy Splat
  #value = aws_instance.ec2-demo[*].public_ip  # Latest Splat
  value = toset([
      for ec2-demo in aws_instance.ec2-demo : ec2-demo.public_dns
    ])    
}

# EC2 Instance Public DNS with MAPS
output "instance_publicdns2" {
  value = tomap({
    for s, ec2-demo in aws_instance.ec2-demo : s => ec2-demo.public_dns
    # S intends to be a subnet ID
  })
}