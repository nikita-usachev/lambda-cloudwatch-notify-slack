variable "alarm_name" {
  type        = string
  default     = "alarm"
}

variable "comparison_operator" {
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  default     = "1"
}

variable "metric_name" {
  type        = string
  default     = "CPUUtilization"
}

variable "namespace" {
  type        = string
  default     = "AWS/EC2"
}

variable "period" {
  type        = number
  default     = "60"
}

variable "statistic" {
  type        = string
  default     = "Average"
}

variable "threshold" {
  type        = number
  default     = "50"
}

variable "datapoints_to_alarm" {
  type        = number
  default     = 1
}

variable "alarm_description" {
  type        = string
  default     = ""
}

variable "actions_enabled" {
  type        = bool
  default     = "true"
}

variable "dimensions" {
  type        = map(string)
  default     = {}
}


variable "alarm_actions" {
}


variable "ok_actions" {
  type        = list(any)
  default     = []
}
