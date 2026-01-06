
# Step 1: Create VPC
resource "aws_vpc" "datacenter_vpc" {

  # Private IP range for the VPC
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "datacenter-vpc"
  }
}

# ---------------------------------------------------
# Task Description:
# Create a VPC using Terraform with the following
# requirements:
#
# - VPC name must be "datacenter-vpc"
# - Use any valid IPv4 CIDR block
# ---------------------------------------------------

