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

variable "iam_access_crud_roles" {
  type        = list(string)
  description = "Existing roles to give CRUD access to"
  default     = []
}

variable "iam_access_crud_users" {
  type        = list(string)
  description = "Existing users to give CRUD access to"
  default     = []
}

variable "iam_access_readonly_roles" {
  type        = list(string)
  description = "Existing roles to give read-only access to"
  default     = []
}

variable "iam_access_readonly_users" {
  type        = list(string)
  description = "Existing users to give read-only access to"
  default     = []
}

variable "cross_account_list" {
  type        = list(string)
  description = "List of accounts that can do ANY operations on SQS"
  default     = []  
}

variable "dead_letter_sqs_arn" {
  type        = string
  default     = ""
  description = "Terraform state key of the SQS to be used as dead letter queue"
}

variable "kms_key_reuse_period" {
  type        = number
  default     = 300
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key before calling AWS KMS again"
}