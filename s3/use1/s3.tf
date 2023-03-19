resource "aws_s3_bucket" "source" {
  bucket   = "zv0-tf-use1-poi098"
  acl      = "private"
}

#data "aws_s3_bucket" "destination" {
#  bucket = "zv0-tf-usw2-poi098"
#}
