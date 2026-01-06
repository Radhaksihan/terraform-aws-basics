# Step 1: Create a VPC
resource "aws_vpc" "datacenter_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "datacenter-vpc"
  }
}

# ---------------------------------------------------
# Task Description:
# Create a VPC using Terraform with the following
# requirement:
#
# - VPC name must be "datacenter-vpc"
# - Use any valid IPv4 CIDR block
# ---------------------------------------------------

