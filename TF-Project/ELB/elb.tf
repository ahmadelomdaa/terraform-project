# Create a public Elastic Load Balancer
resource "aws_lb" "public_alb" {
  # Name of the ELB
  name               = "public-elb"
  # Whether the ELB is internal or not
  internal           = false
  # Type of the ELB
  load_balancer_type = "application"
  # IDs of the security groups to associate with the ELB
  security_groups    = [var.public-securitygroup-id]
  # IDs of the subnets where the ELB will be created
  subnets           = [var.public-subnet-az1-id, var.public-subnet-az2-id]
  # Tags for identifying the ELB
  tags = {
    "Name" = "omda-public-elb" 
  }
}

# Create a target group for the public ELB
resource "aws_lb_target_group" "public_tg" {
  # Name of the target group
  name     = "public-target-group"
  # Port number for the target group
  port     = 80
  # Protocol for the target group
  protocol = "HTTP"
  # ID of the VPC where the target group will be created
  vpc_id   = var.vpc-id
}

# Create a listener for the public ELB
resource "aws_lb_listener" "public_listener" {
  # ARN of the ELB where the listener will be created
  load_balancer_arn = aws_lb.public_alb.arn
  # Port number for the listener
  port              = 80
  # Protocol for the listener
  protocol          = "HTTP"

  # Default action for the listener
  default_action {
    # Type of action (forward to target group)
    type             = "forward"
    # ARN of the target group
    target_group_arn = aws_lb_target_group.public_tg.arn
  }
}

# Create a private Elastic Load Balancer
resource "aws_lb" "private_alb" {
  # Name of the ELB
  name               = "private-elb"
  # Whether the ELB is internal or not
  internal           = true
  # Type of the ELB
  load_balancer_type = "application"
  # IDs of the security groups to associate with the ELB
  security_groups    = [var.private-securitygroup-id]
  # IDs of the subnets where the ELB will be created
  subnets           = [var.private-subnet-az1-id, var.private-subnet-az2-id]
  # Tags for identifying the ELB
  tags = {
    "Name" = "omda-private-elb" 
  }
}

# Create a target group for the private ELB
resource "aws_lb_target_group" "private_tg" {
  # Name of the target group
  name     = "private-target-group"
  # Port number for the target group
  port     = 80
  # Protocol for the target group
  protocol = "HTTP"
  # ID of the VPC where the target group will be created
  vpc_id   = var.vpc-id
}

# Create a listener for the private ELB
resource "aws_lb_listener" "private_listener" {
  # ARN of the ELB where the listener will be created
  load_balancer_arn = aws_lb.private_alb.arn
  # Port number for the listener
  port              = 80
  # Protocol for the listener
  protocol          = "HTTP"

  # Default action for the listener
  default_action {
    # Type of action (forward to target group)
    type             = "forward"
    # ARN of the target group
    target_group_arn = aws_lb_target_group.private_tg.arn
  }
}
