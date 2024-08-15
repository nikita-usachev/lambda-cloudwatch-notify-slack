module "notify_slack" {
  source = "./modules/lambda"

  slack_webhook_url  = var.slack_webhook_url
  slack_username     = var.slack_username
  slack_channel      = var.slack_channel
  lambda_policy_name = var.lambda_policy_name
  lambda_role_name   = var.lambda_role_name
  function_name      = var.function_name
  sns_topic_name     = var.sns_topic_name

}

module "cloudwatch_alarm_EKS_Cluster" {
  source = "./modules/cloudwatch-alarm"

  alarm_name          = var.alarm_name
  namespace           = var.namespace
  comparison_operator = var.comparison_operator
  metric_name         = var.metric_name
  alarm_description   = var.alarm_description
  evaluation_periods  = var.evaluation_periods
  actions_enabled     = var.actions_enabled
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_actions       = [module.notify_slack.aws_sns_topic_arn]
}
