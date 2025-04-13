# Variable for the ID of the public subnet in Availability Zone 1 (us-east-1a)
variable "public-subnet-az1-id" {
  description = "The ID of the public subnet in AZ1 us-east-1a"
}

# Variable for the ID of the public subnet in Availability Zone 2 (us-east-1b)
variable "public-subnet-az2-id" {
  description = "The ID of the public subnet in AZ2 us-east-1b"
}

# Variable for the ID of the private subnet in Availability Zone 1 (us-east-1a)
variable "private-subnet-az1-id" {
  description = "The ID of the private subnet in AZ1 us-east-1a"
}

# Variable for the ID of the private subnet in Availability Zone 2 (us-east-1b)
variable "private-subnet-az2-id" {
  description = "The ID of the private subnet in AZ2 us-east-1b"
}

# Variable for the ID of the public security group
variable "public-securitygroup-id" {
  description = "The ID of the public security group"
}

# Variable for the ID of the private security group
variable "private-securitygroup-id" {
  description = "The ID of the private security group"
}

# Variable for the ARN of the public target group
variable "public-targetgroup-arn" {
  description = "The ARN of the public target group to attach to the public EC2s"
}

# Variable for the ARN of the private target group
variable "private-targetgroup-arn" {
  description = "The ARN of the private target group to attach to the private EC2s"
}
