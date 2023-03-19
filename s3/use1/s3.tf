resource "aws_s3_bucket" "source" {
  bucket   = "zv0-tf-use1-poi098"
}

resource "aws_s3_bucket_acl" "source_bucket_acl" {
  bucket = aws_s3_bucket.source.id
  acl    = "private"
}
