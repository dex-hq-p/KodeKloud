resource "aws_s3_bucket" "devops" {
  bucket = "devops-s3-448997063"
}

resource "aws_s3_bucket_public_access_block" "devops" {
  bucket = aws_s3_bucket.devops.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}