resource "aws_sqs_queue" "main" {
  name                              = var.sqs_name
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_key_reuse_period

  redrive_policy = var.dead_letter_sqs_arn == "" ? null : jsonencode({
    deadLetterTargetArn = var.dead_letter_sqs_arn
    maxReceiveCount     = 4
  })

  policy = length(var.cross_account_list) > 0 ? data.aws_iam_policy_document.cross_account_policy[0].json : null
}

resource "aws_iam_policy" "crud" {
  name   = "aid-sqs-crud-${var.sqs_name}"
  policy = data.aws_iam_policy_document.crud.json
  count  = (length(var.iam_access_crud_roles) + length(var.iam_access_crud_users)) > 0 ? 1 : 0

}

resource "aws_iam_role_policy_attachment" "crud-attach" {
  for_each   = { for role in var.iam_access_crud_roles : role => role }
  role       = each.key
  policy_arn = aws_iam_policy.crud.0.arn  
}

resource "aws_iam_user_policy_attachment" "crud-attach" {
  for_each   = { for user in var.iam_access_crud_users : user => user }
  user       = each.key
  policy_arn = aws_iam_policy.crud.0.arn  
}

resource "aws_iam_policy" "readonly" {
  name   = "aid-sqs-readonly-${var.sqs_name}"
  policy = data.aws_iam_policy_document.readonly.json
  count  = (length(var.iam_access_readonly_roles) + length(var.iam_access_readonly_users)) > 0 ? 1 : 0
}

resource "aws_iam_role_policy_attachment" "readonly-attach" {
  for_each   = { for role in var.iam_access_readonly_roles : role => role }
  role       = each.key
  policy_arn = aws_iam_policy.readonly.0.arn  
}

resource "aws_iam_user_policy_attachment" "readonly-attach" {
  for_each   = { for user in var.iam_access_readonly_users : user => user }
  user       = each.key
  policy_arn = aws_iam_policy.readonly.0.arn  
}
