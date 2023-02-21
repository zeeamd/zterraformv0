resource "aws_acm_certificate" "privatecert" {
  domain_name               = var.common_name
  certificate_authority_arn = aws_acmpca_certificate_authority.subordinate.arn
  depends_on = [
    aws_acmpca_certificate_authority_certificate.subordinate
  ]
  lifecycle {
    create_before_destroy = true
  }
}
