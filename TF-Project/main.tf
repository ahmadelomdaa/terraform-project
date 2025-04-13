# Module for S3 state file configuration
module "s3-StateFile" {
  source = "./S3-StateFile"
}

# Terraform backend configuration for storing state in S3
terraform {
  backend "s3" {
    # Bucket name for storing Terraform state
    bucket         = "omda-remote-statefile"
    # Path to the state file
    key            = "dev/terraform.tfstate"
    # AWS region where the bucket is located
    region         = "us-east-1"
    # Enable encryption for the state file
    encrypt        = true
  }
}

# Module for creating the VPC
module "vpc" {
  source = "./VPC"
  # CIDR block for the VPC
  vpc-cidr = "10.0.0.0/16"
}

# Module for creating subnets
module "subnets" {
  source = "./Subnets"
  # ID of the VPC where subnets will be created
  vpc_id = module.vpc.VPC-id

  # CIDR blocks for public and private subnets in AZ1 and AZ2
  public-cidr-az1 = "10.0.1.0/24"
  public-cidr-az2 = "10.0.2.0/24"
  private-cidr-az1 = "10.0.3.0/24"
  private-cidr-az2 = "10.0.4.0/24"

  # Availability zones for subnets
  az-1 = "us-east-1a"
  az-2 = "us-east-1b"
}

# Module for creating gateways (Internet Gateway and NAT Gateway)
module "gateways" {
  source = "./Gateways"
  # ID of the VPC where gateways will be created
  vpc-id = module.vpc.VPC-id

  # ID of the public subnet in AZ1 for NAT Gateway
  public_subnet_az1-id = module.subnets.public-subnet-az1-id
}

# Module for creating route tables
module "routes" {
  source = "./Routes"
  # ID of the VPC where route tables will be created
  vpc-id = module.vpc.VPC-id

  # IDs of Internet Gateway and NAT Gateway
  internet-gateway-id = module.gateways.internet-gateway-id
  nat-gateway-id = module.gateways.nat-gateway-az1-id

  # IDs of public and private subnets in AZ1 and AZ2
  public_subnet_az1-id = module.subnets.public-subnet-az1-id
  public_subnet_az2-id = module.subnets.public-subnet-az2-id

  private_subnet_az1-id = module.subnets.private-subnet-az1-id
  private_subnet_az2-id = module.subnets.private-subnet-az2-id
}

# Module for creating security groups
module "sg" {
  source = "./SecurityGroups"
  # ID of the VPC where security groups will be created
  vpc-id = module.vpc.VPC-id
}

# Module for creating Elastic Load Balancers
module "elbs" {
  source = "./ELB"
  # ID of the VPC where ELBs will be created
  vpc-id = module.vpc.VPC-id

  # IDs of private and public security groups
  private-securitygroup-id = module.sg.private-sg-id
  public-securitygroup-id = module.sg.public-sg-id

  # IDs of private subnets in AZ1 and AZ2
  private-subnet-az1-id = module.subnets.private-subnet-az1-id
  private-subnet-az2-id = module.subnets.private-subnet-az2-id

  # IDs of public subnets in AZ1 and AZ2
  public-subnet-az1-id = module.subnets.public-subnet-az1-id
  public-subnet-az2-id = module.subnets.public-subnet-az2-id
}

# Module for creating EC2 instances
module "instances" {
  source = "./Instances"
  # IDs of public subnets in AZ1 and AZ2
  public-subnet-az1-id = module.subnets.public-subnet-az1-id
  public-subnet-az2-id = module.subnets.public-subnet-az2-id

  # IDs of private subnets in AZ1 and AZ2
  private-subnet-az1-id = module.subnets.private-subnet-az1-id
  private-subnet-az2-id = module.subnets.private-subnet-az2-id

  # IDs of public and private security groups
  public-securitygroup-id = module.sg.public-sg-id
  private-securitygroup-id = module.sg.private-sg-id

  # ARNs of public and private target groups
  public-targetgroup-arn = module.elbs.public-target-group-arn
  private-targetgroup-arn = module.elbs.private-target-group-arn
}
