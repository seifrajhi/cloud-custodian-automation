output "sqs_arn" {
  value = join("", module.sqs.*.sqs_arn)
}

output "dead_letter_sqs_arn" {
  value = join("", module.sqs_dead_queue.*.sqs_arn)
}