terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "simple_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"   # Amazon Linux 2023 (ap-south-1)
  instance_type = "t2.micro"

  tags = {
    Name = "simple-ec2"
  }
}

