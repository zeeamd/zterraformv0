resource "aws_cloudwatch_log_group" "tunnel1_logs" {
  name              = "s2s-vpn-tunnel1-logs"
  retention_in_days = var.cw_lg_retention_days
}

#resource "aws_cloudwatch_log_group" "tunnel2_logs" {
#  name              = "s2s-vpn-tunnel2-logs"
#  retention_in_days = var.cw_lg_retention_days
#}
