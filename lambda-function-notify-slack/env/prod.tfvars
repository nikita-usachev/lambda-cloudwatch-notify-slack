slack_webhook_url   = "https://hooks.slack.com/services/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"
slack_username      = "nikita_usachev"
slack_channel       = ""

lambda_policy_name  = "lambda_policy"
lambda_role_name    = "lambda_role"
function_name       = "lambda_function"
sns_topic_name      = "High_CPU_Utilization"

alarm_name          = "EKS Cluster High CPU"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = "1"
metric_name         = "CPUUtilization"
namespace           = "AWS/EC2"
period              = "60"
statistic           = "Maximum"
threshold           = "60"
datapoints_to_alarm = 1
alarm_description   = "EKS Cluster high CPU 60%"
actions_enabled     = "true"
ok_actions          = []

dimensions = {
  AutoScalingGroupName = "eks-worker-group-1-a6c34f6f-e9f1-b97b-7ea9-e25f9a4598c7"
}
