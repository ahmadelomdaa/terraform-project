# Output the public IP of the first public EC2 instance in AZ1
output "public_instance_1_public_ip" {
  value = aws_instance.public-ec2-az1.public_ip
}

# Output the public IP of the second public EC2 instance in AZ2
output "public_instance_2_public_ip" {
  value = aws_instance.public-ec2-az2.public_ip
}

# Output the private IP of the first private EC2 instance in AZ1
output "private_instance_1_private_ip" {
  value = aws_instance.private-ec2-az1.private_ip
}

# Output the private IP of the second private EC2 instance in AZ2
output "private_instance_2_private_ip" {
  value = aws_instance.private-ec2-az2.private_ip
}
