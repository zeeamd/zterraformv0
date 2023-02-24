resource "aws_vpn_connection" "s2svpn" {
  customer_gateway_id = aws_customer_gateway.cgw.id
  transit_gateway_id  = data.aws_ec2_transit_gateway.tgw.id
  type                = "ipsec.1"
  static_routes_only  = true
  enable_acceleration = true

  tunnel1_log_options {
    cloudwatch_log_options {
      log_enabled   = true
      log_group_arn = aws_cloudwatch_log_group.tunnel1_logs.arn
    }
  }

#  tunnel2_log_options = {
#    cloudwatch_log_options = {
#      log_enabled   = true
#      log_group_arn = aws_cloudwatch_log_group.tunnel2_logs.arn
#    }
#  }

  tags = var.tags
}
