resource "aws_customer_gateway" "cgw" {
  bgp_asn         = 65000
  type            = "ipsec.1"
  certificate_arn = aws_acm_certificate.privatecert.arn
}
