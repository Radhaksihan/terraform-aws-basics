
# Step 1: Create a public S3 bucket
resource "aws_s3_bucket" "public_bucket" {
  bucket = "datacenter-s3-public-23906"
}

# Step 2: Allow public access to the bucket
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Step 3: Set bucket ACL as public-read
resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

