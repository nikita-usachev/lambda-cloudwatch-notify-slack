output "cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.alarm.arn
  description = "CloudWatch metric alarm ARN"
}

output "cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.alarm.id
  description = "ID of the CloudWatch metric alarm"
}
