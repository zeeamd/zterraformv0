resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  type       = "ipsec.1"
  ip_address = var.on-prem-router-public-ip
  tags       = var.tags
}
