# Output the ID of the public security group
output "public-sg-id" {
  value = aws_security_group.public-sg.id
}

# Output the ID of the private security group
output "private-sg-id" {
  value = aws_security_group.private-sg.id
}
