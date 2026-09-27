resource "aws_s3_bucket" "nautilus" {
  bucket = "nautilus-s3-611509371"
}

resource "aws_s3_bucket_public_access_block" "nautilus" {
  bucket = aws_s3_bucket.nautilus.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "nautilus" {
  depends_on = [aws_s3_bucket_public_access_block.nautilus]

  bucket = aws_s3_bucket.nautilus.id

  acl = "public-read"
}