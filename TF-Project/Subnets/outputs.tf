# Output the ID of the public subnet in Availability Zone 1
output "public-subnet-az1-id" {
  value = aws_subnet.public-az1.id
}

# Output the ID of the public subnet in Availability Zone 2
output "public-subnet-az2-id" {
  value = aws_subnet.public-az2.id
}

# Output the ID of the private subnet in Availability Zone 1
output "private-subnet-az1-id" {
  value = aws_subnet.private-az1.id
}

# Output the ID of the private subnet in Availability Zone 2
output "private-subnet-az2-id" {
  value = aws_subnet.private-az2.id
}
