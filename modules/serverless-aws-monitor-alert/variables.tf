variable "alarms" {
  type = list(object({
    name            = string
    pattern         = string
    sns_topic       = string
    lambda_function = string
  }))
}

variable "slack_token" {
  type    = string
  default = ""
}
