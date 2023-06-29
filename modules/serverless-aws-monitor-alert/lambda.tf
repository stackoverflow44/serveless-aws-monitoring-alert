resource "aws_lambda_function" "lambda_function" {
  for_each = var.alarms

  function_name    = each.value.name
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.10"
  filename         = "${path.module}/lambda/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/lambda_function.zip")

  timeout     = 10
  memory_size = 128

  environment {
    variables = {
      SLACK_TOKEN = var.slack_token
    }
  }
}

resource "aws_lambda_permission" "lambda_permission" {
  for_each = var.alarms

  statement_id  = "sns-invoke-lambda-${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function[each.key].function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.sns_topic[each.key].arn
}
