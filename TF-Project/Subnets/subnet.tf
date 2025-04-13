# Create a public subnet in Availability Zone 1
resource "aws_subnet" "public-az1" {
  # ID of the VPC where the subnet will be created
  vpc_id = var.vpc_id
  # CIDR block for the public subnet in AZ1
  cidr_block = var.public-cidr-az1
  # Automatically assign a public IP to instances launched in this subnet
  map_public_ip_on_launch = true
  # Availability zone for the subnet
  availability_zone = var.az-1
  # Tag for identifying the subnet
  tags = {
    "Name" = "public-subnet-az1"
  }
}

# Create a public subnet in Availability Zone 2
resource "aws_subnet" "public-az2" {
  # ID of the VPC where the subnet will be created
  vpc_id = var.vpc_id
  # CIDR block for the public subnet in AZ2
  cidr_block = var.public-cidr-az2
  # Automatically assign a public IP to instances launched in this subnet
  map_public_ip_on_launch = true
  # Availability zone for the subnet
  availability_zone = var.az-2
  # Tag for identifying the subnet
  tags = {
    "Name" = "public-subnet-az2"
  }
}

# Create a private subnet in Availability Zone 1
resource "aws_subnet" "private-az1" {
  # ID of the VPC where the subnet will be created
  vpc_id = var.vpc_id
  # CIDR block for the private subnet in AZ1
  cidr_block = var.private-cidr-az1
  # Availability zone for the subnet
  availability_zone = var.az-1
  # Tag for identifying the subnet
  tags = {
    "Name" = "private-subnet-az1"
  }
}

# Create a private subnet in Availability Zone 2
resource "aws_subnet" "private-az2" {
  # ID of the VPC where the subnet will be created
  vpc_id = var.vpc_id
  # CIDR block for the private subnet in AZ2
  cidr_block = var.private-cidr-az2
  # Availability zone for the subnet
  availability_zone = var.az-2
  # Tag for identifying the subnet
  tags = {
    "Name" = "private-subnet-az2"
  }
}
