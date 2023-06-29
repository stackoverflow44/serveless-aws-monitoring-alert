terraform {
  source = "./modules"
}

inputs = {
  alarms = [
    {
      name               = "alarm_name_1"
      pattern            = "ERROR"
      sns_topic          = "arn:aws:sns:us-west-2:123456789012:sns-topic-1"
      lambda_function    = "arn:aws:lambda:us-west-2:123456789012:function:lambda-function-1"
    },
    {
      name               = "alarm_name_2"
      pattern            = "WARNING"
      sns_topic          = "arn:aws:sns:us-west-2:123456789012:sns-topic-2"
      lambda_function    = "arn:aws:lambda:us-west-2:123456789012:function:lambda-function-2"
    }
  ]
  slack_token            = "YOUR_SLACK_TOKEN"
}
