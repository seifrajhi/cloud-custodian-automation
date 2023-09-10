data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_iam_policy_document" "cross_account_policy" {
  count = length(var.cross_account_list) > 0 ? 1 : 0
  
  statement {
    sid = "01"
    effect = "Allow"
    actions = [
      "sqs:*"
    ]
    resources = [
      "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sqs_name}"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }

  statement {
    sid = "02"
    effect = "Allow"
    actions = [
      "sqs:*"
    ]
    resources = [
      "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sqs_name}"
    ]
    principals {
      type        = "AWS"
      identifiers = var.cross_account_list
    }
  }
}

data "aws_iam_policy_document" "crud" {
  statement {
    sid = "0"
    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage",
      "sqs:SendMessageBatch",
      "sqs:DeleteMessage",
      "sqs:DeleteMessageBatch",
      "sqs:GetQueueUrl",
      "sqs:ListQueues",
      "sqs:GetQueueAttributes",                
      "sqs:ListDeadLetterSourceQueues"
    ]
    resources = [
      aws_sqs_queue.main.arn,
    ]
  }
  statement {
    sid = "1"
    actions = [
      "sqs:ListQueues"   
    ]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "readonly" {
  statement {
    sid = "0"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:GetQueueUrl",
      "sqs:ListQueues",
      "sqs:GetQueueAttributes",                
      "sqs:ListDeadLetterSourceQueues"          
    ]
    resources = [
      aws_sqs_queue.main.arn,
    ]
  }
  statement {
    sid = "1"
    actions = [
      "sqs:ListQueues"   
    ]
    resources = [
      "*"
    ]
  }
}