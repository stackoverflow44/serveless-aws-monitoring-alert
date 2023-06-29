resource "aws_cloudwatch_metric_alarm" "alarm" {
  for_each = var.alarms

  alarm_name          = each.value.name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ErrorCount"
  namespace           = "MyApp/LogMetrics"
  period              = 60
  statistic           = "SampleCount"
  threshold           = 1

  alarm_description = "This metric indicates ${each.value.name}"

  alarm_actions = [
    each.value.sns_topic
  ]
}
