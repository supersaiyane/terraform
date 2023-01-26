#terraform output values

#ec2 instance public ip
output "instace_public_ip" {
  description = "Ec2 machine public ip"
  value = aws_instance.ec2-demo.public_ip
}

#ec2 instance public dns
output "instace_public_dns" {
  description = "Ec2 machine public ip"
  value = aws_instance.ec2-demo.public_dns
}