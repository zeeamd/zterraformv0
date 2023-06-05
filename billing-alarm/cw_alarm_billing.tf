#billing alarm
resource "aws_cloudwatch_metric_alarm" "millin_alarm" {
  alarm_name          = "account-billing-alarm-v0"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  #period              = "28800"
  period              = "60"
  statistic           = "Maximum"
  threshold           = 1
  #alarm_actions       = var.create_sns_topic ? concat([aws_sns_topic.sns_alert_topic[0].arn], var.sns_topic_arns) : var.sns_topic_arns

  dimensions = {
    currency       = "usd"
    #linked_account = var.aws_account_id
  }
}
