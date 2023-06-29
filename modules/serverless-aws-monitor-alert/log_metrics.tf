resource "aws_cloudwatch_log_metric_filter" "log_filter" {
  for_each = var.alarms

  name           = each.value.name
  pattern        = each.value.pattern
  log_group_name = "/aws/lambda/my-lambda-function"

  metric_transformation {
    name          = "ErrorCount"
    namespace     = "MyApp/LogMetrics"
    value         = "1"
    default_value = "0"
  }
}
