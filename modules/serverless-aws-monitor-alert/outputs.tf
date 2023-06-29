output "alarm_arn" {
  value = aws_cloudwatch_metric_alarm.alarm[*].arn
}

output "metric_filter_names" {
  value = aws_cloudwatch_log_metric_filter.log_filter[*].name
}

output "topic_arn" {
  value = aws_sns_topic.sns_topic[*].arn
}

output "sns_subscription_arns" {
  value = aws_sns_topic_subscription.sns_subscription[*].arn
}

output "lambda_arn" {
  value = aws_lambda_function.lambda_function[*].arn
}
