# Step 1: Create an EBS volume
resource "aws_ebs_volume" "xfusion_volume" {
  availability_zone = "us-east-1a"
  size              = 2
  type              = "gp3"

  tags = {
    Name = "xfusion-volume"
  }
}

# ---------------------------------------------------
# Task Description:
# Create an AWS EBS volume using Terraform with the
# following requirements:
#
# - Volume name must be "xfusion-volume"
# - Volume type must be gp3
# - Volume size must be 2 GiB
# ---------------------------------------------------

