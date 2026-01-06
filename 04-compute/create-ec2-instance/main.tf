# Step 1: Generate RSA private key
resource "tls_private_key" "xfusion_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Step 2: Create AWS key pair
resource "aws_key_pair" "xfusion_kp" {
  key_name   = "xfusion-kp"
  public_key = tls_private_key.xfusion_key.public_key_openssh
}

# Step 3: Get default security group
data "aws_security_group" "default_sg" {
  name = "default"
}

# Step 4: Create EC2 instance
resource "aws_instance" "xfusion_ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.xfusion_kp.key_name

  vpc_security_group_ids = [
    data.aws_security_group.default_sg.id
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

# ---------------------------------------------------
# Task Description:
# Create an EC2 instance using Terraform with the
# following requirements:
#
# - EC2 Name tag must be "xfusion-ec2"
# - Use Amazon Linux AMI: ami-0c101f26f147fa7fd
# - Instance type must be t2.micro
# - Create a new RSA key pair named "xfusion-kp"
# - Attach the default security group
# ---------------------------------------------------

