# Data source to fetch the latest Linux AMI
data "aws_ami" "linux-ami" {
  most_recent = true
  filter {
    name = "name"
    values = [ "al2023-ami-2023.*" ]
  }
}

# Create a public EC2 instance in Availability Zone 1
resource "aws_instance" "public-ec2-az1" {
  # Use the latest Linux AMI
  ami = data.aws_ami.linux-ami.id
  # Instance type for the EC2
  instance_type = "t2.micro"
  # ID of the public subnet in AZ1
  subnet_id = var.public-subnet-az1-id
  # ID of the public security group
  vpc_security_group_ids = [ var.public-securitygroup-id ]
  # Key pair for SSH access
  key_name = "terraform-project"
  
  # Local-exec provisioner to output the public IP of the instance
  provisioner "local-exec" {
    command = "echo ec2 az1 public ip = ${self.public_ip}"
  }

  # Remote-exec provisioner to configure the instance
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo echo az1 > /var/www/html/index.html",
      "sudo systemctl enable --now httpd"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform-project.pem")
      host        = self.public_ip
    }
  }

  # Tags for identifying the instance
  tags = {
    "Name" = "public-ec2-az1"
  }
}

# Create a public EC2 instance in Availability Zone 2
resource "aws_instance" "public-ec2-az2" {
  # Use the latest Linux AMI
  ami = data.aws_ami.linux-ami.id
  # Instance type for the EC2
  instance_type = "t2.micro"
  # ID of the public subnet in AZ2
  subnet_id = var.public-subnet-az2-id
  # ID of the public security group
  vpc_security_group_ids = [ var.public-securitygroup-id ]
  # Key pair for SSH access
  key_name = "terraform-project"
  
  # Local-exec provisioner to output the public IP of the instance
  provisioner "local-exec" {
    command = "echo ec2 az2 public ip = ${self.public_ip}"
  }

  # Remote-exec provisioner to configure the instance
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo echo az2 > /var/www/html/index.html",
      "sudo systemctl enable --now httpd"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform-project.pem")
      host        = self.public_ip
    }
  }

  # Tags for identifying the instance
  tags = {
    "Name" = "public-ec2-az2"
  }
}

# Attach the first public EC2 instance to the public target group
resource "aws_lb_target_group_attachment" "public_instance_1" {
  # ARN of the public target group
  target_group_arn = var.public-targetgroup-arn
  # ID of the first public EC2 instance
  target_id        = aws_instance.public-ec2-az1.id
  # Port number for the target group
  port             = 80
}

# Attach the second public EC2 instance to the public target group
resource "aws_lb_target_group_attachment" "public_instance_2" {
  # ARN of the public target group
  target_group_arn = var.public-targetgroup-arn
  # ID of the second public EC2 instance
  target_id        = aws_instance.public-ec2-az2.id
  # Port number for the target group
  port             = 80
}

# Create a private EC2 instance in Availability Zone 1
resource "aws_instance" "private-ec2-az1" {
  # Use the latest Linux AMI
  ami = data.aws_ami.linux-ami.id
  # Instance type for the EC2
  instance_type = "t2.micro"
  # ID of the private subnet in AZ1
  subnet_id = var.private-subnet-az1-id
  # ID of the private security group
  vpc_security_group_ids = [ var.private-securitygroup-id ]
  
  # User data to configure the instance
  user_data = <<-EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install httpd -y
               sudo echo 'private ec2 in az1' > /var/www/html/index.html 
               sudo systemctl enable --now httpd
               EOF

  # Tags for identifying the instance
  tags = {
    "Name" = "private-ec2-az1"
  }
}

# Create a private EC2 instance in Availability Zone 2
resource "aws_instance" "private-ec2-az2" {
  # Use the latest Linux AMI
  ami = data.aws_ami.linux-ami.id
  # Instance type for the EC2
  instance_type = "t2.micro"
  # ID of the private subnet in AZ2
  subnet_id = var.private-subnet-az2-id
  # ID of the private security group
  vpc_security_group_ids = [ var.private-securitygroup-id ]
  
  # User data to configure the instance
  user_data = <<-EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install httpd -y
               sudo echo 'private ec2 in az2' > /var/www/html/index.html 
               sudo systemctl enable --now httpd
               EOF

  # Tags for identifying the instance
  tags = {
    "Name" = "private-ec2-az2"
  }
}

# Attach the first private EC2 instance to the private target group
resource "aws_lb_target_group_attachment" "private_instance_1" {
  # ARN of the private target group
  target_group_arn = var.private-targetgroup-arn
  # ID of the first private EC2 instance
  target_id        = aws_instance.private-ec2-az1.id
  # Port number for the target group
  port             = 80
}

# Attach the second private EC2 instance to the private target group
resource "aws_lb_target_group_attachment" "private_instance_2" {
  # ARN of the private target group
  target_group_arn = var.private-targetgroup-arn
  # ID of the second private EC2 instance
  target_id        = aws_instance.private-ec2-az2.id
  # Port number for the target group
  port             = 80
}
