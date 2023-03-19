resource "aws_s3_bucket_versioning" "east" {
  bucket = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "east_to_west" {
  depends_on = [aws_s3_bucket_versioning.east]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.source.id

  rule {
    status = "Enabled"
    destination {
      bucket        = var.dest_bucket_arn
      #storage_class = "STANDARD"
    }
  }

}
