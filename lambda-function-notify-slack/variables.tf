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
  type    = string
  default = "lambda_policy"
}

variable "lambda_role_name" {
  type    = string
  default = "lambda_role"
}

variable "function_name" {
  type    = string
  default = "lambda_function"
}

variable "sns_topic_name" {
  type    = string
  default = "High_CPU_Utilization"
}

variable "alarm_name" {
  type    = string
  default = "EKS Cluster High CPU"
}

variable "comparison_operator" {
  type    = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  type    = string
  default = "1"
}

variable "metric_name" {
  type    = string
  default = "CPUUtilization"
}

variable "namespace" {
  type    = string
  default = "AWS/EC2"
}

variable "period" {
  type    = string
  default = "60"
}

variable "statistic" {
  type    = string
  default = "Maximum"
}

variable "threshold" {
  type    = string
  default = "20"
}

variable "datapoints_to_alarm" {
  type    = number
  default = 1
}

variable "alarm_description" {
  type    = string
  default = "EKS Cluster high CPU 20%"
}

variable "actions_enabled" {
  type    = bool
  default = true
}

variable "alarm_actions" {
  default = []
}

variable "ok_actions" {
  type    = list(string)
  default = []
}

variable "dimensions" {
  type = map(string)
  default = {
    AutoScalingGroupName = "eks-worker-group-1-a6c34f6f-e9f1-b97b-7ea9-e25f9a4598c7"
  }
}
