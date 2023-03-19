resource "aws_s3_bucket_lifecycle_configuration" "versioning-bucket-config" {
  depends_on = [aws_s3_bucket_versioning.east]

  bucket = aws_s3_bucket.source.id

  rule {
    id = "config"

    noncurrent_version_expiration {
      noncurrent_days = 1
    }

    status = "Enabled"
  }
}
