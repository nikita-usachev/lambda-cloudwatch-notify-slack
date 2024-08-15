variable "slack_webhook_url" {
  type    = string
  default = ""
}

variable "slack_username" {
  type    = string
  default = "nikita_usachev"
}

variable "slack_channel" {
  type    = string
  default = ""
}

variable "lambda_policy_name" {
  type        = string
  default     = "lambda_policy"
}

variable "lambda_role_name" {
  type        = string
  default     = "lambda_role"
}

variable "type" {
  type        = string
  default     = "zip"
}

variable "source_file" {
  type        = string
  default     = "notify_slack.py"
}

variable "function_name" {
  type        = string
  default     = "lambda_function"
}

variable "sns_topic_name" {
  type        = string
  default     = ""
}

variable "principal" {
  type        = string
  default     = ""
}

variable "endpoint_auto_confirms" {
  type        = bool
  default     = "true"
}
