# Step 1: Get the default VPC
data "aws_vpc" "default_vpc" {
  default = true
}

# Step 2: Create a security group in the default VPC
resource "aws_security_group" "xfusion_sg" {
  name        = "xfusion-sg"
  description = "Security group for Nautilus App Servers"
  vpc_id      = data.aws_vpc.default_vpc.id

  # Inbound rule: Allow HTTP (port 80)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule: Allow SSH (port 22)
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: Allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------------------------------
# Task Description:
# Use Terraform to create a security group under the
# default VPC with the following requirements:
#
# - Security group name must be "xfusion-sg"
# - Description must be "Security group for Nautilus App Servers"
# - Allow inbound HTTP traffic on port 80 from 0.0.0.0/0
# - Allow inbound SSH traffic on port 22 from 0.0.0.0/0
# - Security group must be created in the default VPC
# ---------------------------------------------------

