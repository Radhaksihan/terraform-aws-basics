# Step 1: AWS provider configuration
provider "aws" {
  region = "us-east-1"
}

# Step 2: Create VPC
resource "aws_vpc" "datacenter_vpc" {

  # Private IP range for the VPC
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "datacenter-vpc"
  }
}

# Commands to deploy:
# terraform init
# terraform plan
# terraform apply

