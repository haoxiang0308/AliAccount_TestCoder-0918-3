resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"
  
  tags = {
    Name        = "My S3 Bucket"
    Environment = "Development"
  }
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}