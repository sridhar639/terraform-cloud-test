resource "aws_s3_bucket" "mys3" {
  bucket = var.bucket_name
  force_destroy = true

  tags = var.s3_tag
}


resource "aws_s3_bucket_ownership_controls" "bucketowner" {
  bucket = aws_s3_bucket.mys3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3public" {
  bucket = aws_s3_bucket.mys3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "s3policy" {
  depends_on = [ aws_s3_bucket_public_access_block.s3public , aws_s3_bucket_ownership_controls.bucketowner]
  bucket = aws_s3_bucket.mys3.id

  policy = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
  EOF
}