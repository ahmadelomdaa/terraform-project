# Variable for the ID of the VPC to use
variable "vpc_id" {
  description = "This is the ID of the VPC that we will use"
}

# Variable for the CIDR block of the public subnet in Availability Zone 1
variable "public-cidr-az1" {
  description = "This is the CIDR block of the public subnet in AZ 1"
}

# Variable for the CIDR block of the public subnet in Availability Zone 2
variable "public-cidr-az2" {
  description = "This is the CIDR block of the public subnet in AZ 2"
}

# Variable for the CIDR block of the private subnet in Availability Zone 1
variable "private-cidr-az1" {
  description = "This is the CIDR block of the private subnet in AZ 1"
}

# Variable for the CIDR block of the private subnet in Availability Zone 2
variable "private-cidr-az2" {
  description = "This is the CIDR block of the private subnet in AZ 2"
}

# Variable for the first availability zone (us-east-1a)
variable "az-1" {
  description = "The first availability zone, which is us-east-1a"
}

# Variable for the second availability zone (us-east-1b)
variable "az-2" {
  description = "The second availability zone, which is us-east-1b"
}
