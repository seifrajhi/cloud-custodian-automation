
#
# Mailer
#
resource "aws_iam_role" "mailer_cloud_custodian_infosec" {
  name = "mailer_cloud_custodian_infosec-${data.aws_region.current.name}"
  path = "/sre/terraform_managed/"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
  tags               = module.tags.required_tags
}

# resource "aws_iam_role_policy_attachment" "lambda_cloud_custodian_infosec_readonly" {
#   role       = aws_iam_role.lambda_cloud_custodian_infosec.name
#   policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
# }

resource "aws_iam_policy" "mailer_cloud_custodian_infosec" {
  name   = "mailer_cloud_custodian_infosec-${data.aws_region.current.name}"
  policy = data.aws_iam_policy_document.mailer_cloud_custodian_infosec.json

  tags = module.tags.required_tags
}

resource "aws_iam_role_policy_attachment" "mailer_cloud_custodian_infosec" {
  role       = aws_iam_role.mailer_cloud_custodian_infosec.name
  policy_arn = aws_iam_policy.mailer_cloud_custodian_infosec.arn
}





data "aws_iam_policy_document" "mailer_cloud_custodian_infosec" {
  statement {
    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "logs:CreateLogGroup"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    resources = [
      "arn:aws:sqs:${local.aws_region}:${local.aws_account_id}:*cloudCustodian*"
    ]
  }

  statement {
    actions = [
      "ses:SendRawEmail"
    ]
    resources = ["*"]
  }
}
