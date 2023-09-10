<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.crud](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.crud-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.readonly-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.crud-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.readonly-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_iam_policy_document.cross_account_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.crud](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sqs_name"></a> [sqs\_name](#input\_sqs\_name) | Name of the SQS Queue | `string` | n/a | yes |
| <a name="input_cross_account_list"></a> [cross\_account\_list](#input\_cross\_account\_list) | List of accounts that can do ANY operations on SQS | `list(string)` | `[]` | no |
| <a name="input_dead_letter_sqs_arn"></a> [dead\_letter\_sqs\_arn](#input\_dead\_letter\_sqs\_arn) | Terraform state key of the SQS to be used as dead letter queue | `string` | `""` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | n/a | `number` | `0` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | n/a | `bool` | `false` | no |
| <a name="input_iam_access_crud_roles"></a> [iam\_access\_crud\_roles](#input\_iam\_access\_crud\_roles) | Existing roles to give CRUD access to | `list(string)` | `[]` | no |
| <a name="input_iam_access_crud_users"></a> [iam\_access\_crud\_users](#input\_iam\_access\_crud\_users) | Existing users to give CRUD access to | `list(string)` | `[]` | no |
| <a name="input_iam_access_readonly_roles"></a> [iam\_access\_readonly\_roles](#input\_iam\_access\_readonly\_roles) | Existing roles to give read-only access to | `list(string)` | `[]` | no |
| <a name="input_iam_access_readonly_users"></a> [iam\_access\_readonly\_users](#input\_iam\_access\_readonly\_users) | Existing users to give read-only access to | `list(string)` | `[]` | no |
| <a name="input_kms_key_reuse_period"></a> [kms\_key\_reuse\_period](#input\_kms\_key\_reuse\_period) | The length of time, in seconds, for which Amazon SQS can reuse a data key before calling AWS KMS again | `number` | `300` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | n/a | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | n/a | `number` | `345600` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | n/a | `number` | `0` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | n/a | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | n/a |
<!-- END_TF_DOCS -->