resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  datapoints_to_alarm = var.datapoints_to_alarm
  alarm_description   = var.alarm_description
  actions_enabled     = var.actions_enabled
  alarm_actions       = var.alarm_actions
  ok_actions          = var.ok_actions
  dimensions          = var.dimensions
}
