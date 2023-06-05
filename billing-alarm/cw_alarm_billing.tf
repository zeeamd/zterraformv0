data "aws_caller_identity" "current" {}

#billing alarm
resource "aws_cloudwatch_metric_alarm" "millin_alarm" {
  alarm_name          = "aws-account-billing-alarm-v0"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  #period 6 hrs
  period              = "21600"
  statistic           = "Maximum"
  #amount at which to trigger
  threshold           = 1

  dimensions = {
    Currency      = "USD"
    LinkedAccount = data.aws_caller_identity.current.account_id
  }
}
