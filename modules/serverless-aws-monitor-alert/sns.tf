resource "aws_sns_topic" "sns_topic" {
  for_each = var.alarms

  name         = each.key
  display_name = each.key
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = var.alarms

  topic_arn = aws_sns_topic.sns_topic[each.key].arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.lambda_function[each.key].arn
}
