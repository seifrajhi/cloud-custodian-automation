variable "sqs_name" {
  description = "Name of the SQS Queue"
  type        = string
}

variable "visibility_timeout_seconds" {
  default = 30
  type    = number
}

variable "message_retention_seconds" {
  default = 345600
  type    = number
}

variable "max_message_size" {
  default = 262144
  type    = number
}

variable "delay_seconds" {
  default = 0
  type    = number
}

variable "receive_wait_time_seconds" {
  default = 0
  type    = number
}

variable "fifo_queue" {
  default = false
  type    = bool
}

variable "cross_account_list" {
  type        = list(string)
  description = "List of accounts that can do CRUD operations on SQS"
  default     = []  
}

variable "dead_letter_sqs_name" {
  type        = string
  default     = ""
  description = "Name for the SQS to be used as dead letter queue"
}

variable "lambda_execution_role_name" {
  type        = string
  default     = "cloud-custodian-lambda"
  description = "Name of the cloud custodian lambda execution role"
}

variable "cloud_custodian_log_group" {
  type        = string
  default     = "/cloud-custodian/lambda"
  description = "Name of the cloud custodian log group"
}

variable "cloud_custodian_s3_bucket" {
  type        = string
  default     = "/cloud-custodian/lambda"
  description = "Name of the cloud custodian log group"
}

variable "deploy_sqs" {
  type        = bool
  default     = false
  description = "True to deploy the sqs resources to be used by c7n mailer"
}