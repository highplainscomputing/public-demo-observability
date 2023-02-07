resource "aws_sns_topic" "prometheus_alert" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_policy" "sns_topic_policy_resource" {
  arn = aws_sns_topic.prometheus_alert.arn

  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.current.account_id,
      ]
    }
    
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.prometheus_alert.arn,
    ]

    sid = "__default_statement_ID"
  }
  statement {
    actions = [
      "sns:Publish",
      "sns:GetTopicAttributes"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values = ["${data.aws_caller_identity.current.account_id}",]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = ["${aws_prometheus_workspace.prometheus.arn}",]
    }

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["aps.amazonaws.com"]
    }

    resources = [
      "${aws_sns_topic.prometheus_alert.arn}",
    ]

    sid = "Allow_Publish_Alarms"
  }
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.prometheus_alert.arn
  protocol  = "email"
  endpoint  = var.sns_email
}