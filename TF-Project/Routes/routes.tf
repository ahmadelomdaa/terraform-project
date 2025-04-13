# Create a public route table for the VPC
resource "aws_route_table" "public_rt" {
  # ID of the VPC where the route table will be created
  vpc_id = var.vpc-id

  # Route for all traffic to go through the Internet Gateway
  route {
    # CIDR block for all IP addresses
    cidr_block = "0.0.0.0/0"
    # ID of the Internet Gateway
    gateway_id = var.internet-gateway-id
  }

  # Tags for identifying the route table
  tags = {
    "Name" = "omda-internet-route" 
  }
}

# Associate the public route table with the public subnet in AZ1
resource "aws_route_table_association" "public_assoc_1" {
  # ID of the public subnet in AZ1
  subnet_id      = var.public_subnet_az1-id
  # ID of the public route table
  route_table_id = aws_route_table.public_rt.id
}

# Associate the public route table with the public subnet in AZ2
resource "aws_route_table_association" "public_assoc_2" {
  # ID of the public subnet in AZ2
  subnet_id      = var.public_subnet_az2-id
  # ID of the public route table
  route_table_id = aws_route_table.public_rt.id
}

# Create a private route table for the VPC
resource "aws_route_table" "private_rt" {
  # ID of the VPC where the route table will be created
  vpc_id = var.vpc-id

  # Route for all traffic to go through the NAT Gateway
  route {
    # CIDR block for all IP addresses
    cidr_block = "0.0.0.0/0"
    # ID of the NAT Gateway
    gateway_id = var.nat-gateway-id
  }
}

# Associate the private route table with the private subnet in AZ1
resource "aws_route_table_association" "private_assoc_1" {
  # ID of the private subnet in AZ1
  subnet_id      = var.private_subnet_az1-id
  # ID of the private route table
  route_table_id = aws_route_table.private_rt.id
}

# Associate the private route table with the private subnet in AZ2
resource "aws_route_table_association" "private_assoc_2" {
  # ID of the private subnet in AZ2
  subnet_id      = var.private_subnet_az2-id
  # ID of the private route table
  route_table_id = aws_route_table.private_rt.id
}
