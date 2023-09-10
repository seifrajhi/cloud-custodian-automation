data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_iam_policy_document" "custodian_lambda" {
  statement {
    sid = "0"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:PutObjectAcl",
      "s3:DeleteObject"
    ]

    resources = [
      "${aws_s3_bucket.main.arn}/*",
    ]
  }

  statement {
    sid = "1"

    actions = [
      "cloudwatch:PutMetricData",
      "ec2:DeleteNetworkInterface",
      "ec2:CreateNetworkInterface",
      "events:PutRule",
      "events:PutTargets",
      "iam:PassRole",
      "iam:DeleteLoginProfile",
      "lambda:CreateFunction",
      "lambda:TagResource",
      "lambda:CreateEventSourceMapping",
      "lambda:UntagResource",
      "lambda:PutFunctionConcurrency",
      "lambda:DeleteFunction",
      "lambda:UpdateEventSourceMapping",
      "lambda:InvokeFunction",
      "lambda:UpdateFunctionConfiguration",
      "lambda:UpdateAlias",
      "lambda:UpdateFunctionCode",
      "lambda:AddPermission",
      "lambda:DeleteAlias",
      "lambda:DeleteFunctionConcurrency",
      "lambda:DeleteEventSourceMapping",
      "lambda:RemovePermission",
      "lambda:CreateAlias",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "tag:TagResources"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "2"

    actions = [
      "rds:AddTagsToResource",
      "rds:DeleteDBClusterSnapshot",
      "rds:ListTagsForResource",
      "rds:DeleteDBSnapshot",
      "rds:RemoveTagsFromResource"
    ]

    resources = [
      "arn:aws:rds:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:snapshot:*",
      "arn:aws:rds:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster-snapshot:*"
    ]
  }

  statement {
    sid = "3"

    actions = [
      "ec2:DeleteVolume",
      "ec2:DeleteSnapshot",
      "ec2:DeleteTags",
      "ec2:CreateTags",
      "ec2:DeregisterImage",
      "ec2:TerminateInstances",
      "ec2:StartInstances",
      "ec2:StopInstances"
    ]

    resources = [
      "arn:aws:ec2:${data.aws_region.current.name}::snapshot/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:volume/*",
      "arn:aws:ec2:${data.aws_region.current.name}::image/*",
      "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:instance/*"
    ]
  }

  statement {
    sid = "4"

    actions = [
      "iam:DeactivateMFADevice",
      "iam:DeleteAccessKey",
      "iam:DeletePolicy",
      "iam:DeleteRole",
      "iam:DeleteUser",
      "iam:DeletePolicyVersion"
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
  }

  statement {
    sid = "5"

    actions = [
      "autoscaling:ResumeProcesses",
      "autoscaling:SuspendProcesses"
    ]

    resources = [
      "arn:aws:autoscaling:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:autoScalingGroup:*:autoScalingGroupName/*"
    ]
  }
}

