# Step 1: Create a private S3 bucket
resource "aws_s3_bucket" "private_bucket" {
  bucket = "datacenter-s3-23906"
}

# Step 2: Block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "private_block" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Step 3: Set bucket ACL as private
resource "aws_s3_bucket_acl" "private_acl" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"
}

