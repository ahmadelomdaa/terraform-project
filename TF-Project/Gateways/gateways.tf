# Create Internet Gateway (IGW) for Public Subnets
resource "aws_internet_gateway" "igw" {
  # ID of the VPC where the IGW will be created
  vpc_id = var.vpc-id
  # Tags for identifying the IGW
  tags = {
    "Name" = "omda-igw" 
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  # Tags for identifying the EIP
  tags = {
    "Name" = "omda-eip1" 
  }
}

# Create NAT Gateway for Private Subnets
resource "aws_nat_gateway" "nat_gw" {
  # ID of the Elastic IP to associate with the NAT Gateway
  allocation_id = aws_eip.nat_eip.id
  # ID of the public subnet where the NAT Gateway will be created
  subnet_id     = var.public_subnet_az1-id
  # Tags for identifying the NAT Gateway
  tags = {
    "Name" = "omda-natgw" 
  }
}
