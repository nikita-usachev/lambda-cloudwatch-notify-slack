resource "aws_iam_role_policy" "lambda" {
  name   = var.lambda_policy_name
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {

  statement {
    sid       = "SidToOverride"
    effect    = "Allow"
    actions   = ["logs:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "lambda" {
  name               = var.lambda_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# Local values for avoiding repetitions

locals {
  lambda-zip-location = "./modules/lambda/notify_slack.zip"
}

data "archive_file" "notify_slack" {
  type        = "zip"
  source_file = "../../tf-modules/lambda//notify_slack.py"
  output_path = local.lambda-zip-location
}

# Creates a lambda function using local file "notify_slack.py"

resource "aws_lambda_function" "lambda" {
  filename      = local.lambda-zip-location
  function_name = var.function_name
  role          = aws_iam_role.lambda.arn

  # Source_code_hash = filebase64sha256(local.lambda-zip-location)
  
  handler = "notify_slack.lambda_handler"
  runtime = "python3.8"
  
  # Variables used in lamda function "notify_slack.py"
  environment {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
      SLACK_CHANNEL     = var.slack_channel
      SLACK_USERNAME    = var.slack_username
    }
  }
}

# SNS topic 

resource "aws_sns_topic" "topic" {
  name = var.sns_topic_name
}

# Subscribe SNS topic to Lambda function

resource "aws_sns_topic_subscription" "topic_lambda" {
  topic_arn              = aws_sns_topic.topic.arn
  protocol               = "lambda"
  endpoint               = aws_lambda_function.lambda.arn
  endpoint_auto_confirms = var.endpoint_auto_confirms
}

# Lambda permissions for SNS

resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.topic.arn
}
