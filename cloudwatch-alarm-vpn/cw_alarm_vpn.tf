#vpn alarm
resource "aws_cloudwatch_metric_alarm" "s2s_tunnel_status" {
  alarm_name          = "vpn-tunnel-state-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  metric_name         = "TunnelState"
  namespace           = "AWS/VPN"
  statistic           = "Minimum"
  evaluation_periods  = 3
  period              = 60
  threshold           = 0.5
  alarm_actions       = [var.sns]
  dimensions = {
    VpnId = var.vpn
  }
}
