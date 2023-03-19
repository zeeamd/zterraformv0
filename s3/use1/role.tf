resource "aws_iam_role" "replication" {
  name                = "tf-s3-replication-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })
}
