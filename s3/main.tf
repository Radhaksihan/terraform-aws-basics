provider "aws" {
  region = "ap-south-1"   # Mumbai
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-simple-tf-bucket-128374345"  # must be globally unique

  tags = {
    Name = "my-simple-bucket"
  }
}

