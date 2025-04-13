# Variable for the ID of the VPC
variable "vpc-id" {
  description = "The ID of the VPC"
}

# Variable for the ID of the public subnet in Availability Zone 1
variable "public_subnet_az1-id" {
  description = "The ID of the public subnet in AZ1"
}

# Variable for the ID of the public subnet in Availability Zone 2
variable "public_subnet_az2-id" {
  description = "The ID of the public subnet in AZ2"
}

# Variable for the ID of the private subnet in Availability Zone 1
variable "private_subnet_az1-id" {
  description = "The ID of the private subnet in AZ1"
}

# Variable for the ID of the private subnet in Availability Zone 2
variable "private_subnet_az2-id" {
  description = "The ID of the private subnet in AZ2"
}

# Variable for the ID of the Internet Gateway for public subnets
variable "internet-gateway-id" {
  description = "The ID of the Internet Gateway for the public subnets"
}

# Variable for the ID of the NAT Gateway for private subnets
variable "nat-gateway-id" {
  description = "The ID of the NAT Gateway for the private subnets"
}
