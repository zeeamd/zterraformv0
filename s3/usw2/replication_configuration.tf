resource "aws_s3_bucket_versioning" "west" {
  bucket = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

#resource "aws_s3_bucket_replication_configuration" "east_to_west" {
#  depends_on = [aws_s3_bucket_versioning.east]
#
#  role   = aws_iam_role.east_replication.arn
#  bucket = aws_s3_bucket.source.id
#
#  rule {
#    destination {
#      bucket        = data.aws_s3_bucket.destination.arn
#      storage_class = "STANDARD"
#    }
#  }
#
#}
