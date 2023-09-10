<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sqs"></a> [sqs](#module\_sqs) | ../sqs-module |  |
| <a name="module_sqs_dead_queue"></a> [sqs\_dead\_queue](#module\_sqs\_dead\_queue) | ../sqs-module |  |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cloud_custodian_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.custodian_lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.mailer_cloud_custodian_infosec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.execution_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.mailer_cloud_custodian_infosec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_readall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.mailer_cloud_custodian_infosec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.c7n-infosec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.ownership_controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_iam_policy_document.custodian_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.mailer_cloud_custodian_infosec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sqs_name"></a> [sqs\_name](#input\_sqs\_name) | Name of the SQS Queue | `string` | n/a | yes |
| <a name="input_cloud_custodian_log_group"></a> [cloud\_custodian\_log\_group](#input\_cloud\_custodian\_log\_group) | Name of the cloud custodian log group | `string` | `"/cloud-custodian/lambda"` | no |
| <a name="input_cloud_custodian_s3_bucket"></a> [cloud\_custodian\_s3\_bucket](#input\_cloud\_custodian\_s3\_bucket) | Name of the cloud custodian log group | `string` | `"/cloud-custodian/lambda"` | no |
| <a name="input_cross_account_list"></a> [cross\_account\_list](#input\_cross\_account\_list) | List of accounts that can do CRUD operations on SQS | `list(string)` | `[]` | no |
| <a name="input_dead_letter_sqs_name"></a> [dead\_letter\_sqs\_name](#input\_dead\_letter\_sqs\_name) | Name for the SQS to be used as dead letter queue | `string` | `""` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | n/a | `number` | `0` | no |
| <a name="input_deploy_sqs"></a> [deploy\_sqs](#input\_deploy\_sqs) | True to deploy the sqs resources to be used by c7n mailer | `bool` | `false` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | n/a | `bool` | `false` | no |
| <a name="input_lambda_execution_role_name"></a> [lambda\_execution\_role\_name](#input\_lambda\_execution\_role\_name) | Name of the cloud custodian lambda execution role | `string` | `"cloud-custodian-lambda"` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | n/a | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | n/a | `number` | `345600` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | n/a | `number` | `0` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | n/a | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dead_letter_sqs_arn"></a> [dead\_letter\_sqs\_arn](#output\_dead\_letter\_sqs\_arn) | n/a |
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | n/a |
<!-- END_TF_DOCS -->