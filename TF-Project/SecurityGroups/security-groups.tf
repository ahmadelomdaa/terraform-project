# Create a public security group for the VPC
resource "aws_security_group" "public-sg" {
  # ID of the VPC where the security group will be created
  vpc_id = var.vpc-id

  # Allow inbound HTTP traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound SSH traffic from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for identifying the security group
  tags = {
    "Name" = "omda-public-sg" 
  }
}

# Create a private security group for the VPC
resource "aws_security_group" "private-sg" {
  # ID of the VPC where the security group will be created
  vpc_id = var.vpc-id

  # Allow inbound HTTP traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for identifying the security group
  tags = {
    "Name" = "omda-private-sg" 
  }
}
