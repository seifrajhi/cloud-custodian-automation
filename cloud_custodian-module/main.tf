resource "aws_iam_role" "execution_lambda" {
  name = "${var.lambda_execution_role_name}-${data.aws_region.current.name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_policy" "custodian_lambda_policy" {
  name   = "custodian-lambda-${data.aws_region.current.name}"
  policy = data.aws_iam_policy_document.custodian_lambda.json
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.execution_lambda.name
  policy_arn = aws_iam_policy.custodian_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_readall" {
  role       = aws_iam_role.execution_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

module "sqs_dead_queue" {
  count  = var.deploy_sqs ? 1 : 0
  source = "../sqs-module"
  
  sqs_name                    = "${var.dead_letter_sqs_name}-${data.aws_region.current.name}"
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  fifo_queue                  = var.fifo_queue

  iam_access_crud_roles = [
    "${var.lambda_execution_role_name}-${data.aws_region.current.name}"
  ]

  cross_account_list = var.cross_account_list
}

module "sqs" {
  count  = var.deploy_sqs ? 1 : 0
  source = "../sqs-module"
  
  sqs_name                    = "${var.sqs_name}-${data.aws_region.current.name}"
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  fifo_queue                  = var.fifo_queue

  iam_access_crud_roles = [
    "${var.lambda_execution_role_name}-${data.aws_region.current.name}"
  ]

  dead_letter_sqs_arn = module.sqs_dead_queue.0.sqs_arn
  
  cross_account_list = var.cross_account_list
}

resource "aws_cloudwatch_log_group" "cloud_custodian_log" {
  name              = var.cloud_custodian_log_group
  retention_in_days = 30
}


resource "aws_s3_bucket" "main" {
  bucket = var.cloud_custodian_s3_bucket

}

resource "aws_s3_bucket_acl" "c7n-infosec" {
  bucket = aws_s3_bucket.main.bucket
  acl    = "private"
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
