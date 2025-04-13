# Output the ID of the Internet Gateway
output "internet-gateway-id" {
  value = aws_internet_gateway.igw.id
}

# Output the ID of the NAT Gateway in Availability Zone 1
output "nat-gateway-az1-id" {
  value = aws_nat_gateway.nat_gw.id
}
