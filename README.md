# terraform-aws-truefoundry-platform-features
Truefoundry AWS platform features

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_truefoundry_bucket"></a> [truefoundry\_bucket](#module\_truefoundry\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.15.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.truefoundry_platform_user_keys](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.truefoundry_platform_feature_user_ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_user_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_user_ssm_policy](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_policy) | resource |
| [aws_iam_user.truefoundry_platform_user](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_ecr_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_s3_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_ssm_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy_document.truefoundry_platform_feature_user_ecr_policy_document](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_user_s3_policy_document](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_user_ssm_policy_document](https://registry.terraform.io/providers/hashicorp/aws/5.14.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account id | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_blob_storage_cors_origins"></a> [blob\_storage\_cors\_origins](#input\_blob\_storage\_cors\_origins) | List of CORS origins for Mlfoundry bucket | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_blob_storage_enable_override"></a> [blob\_storage\_enable\_override](#input\_blob\_storage\_enable\_override) | Enable overriding name of s3 bucket. This will only be used if feature\_blob\_storage\_enabled is enabled. You need to pass s3\_override\_name to pass the bucket name | `bool` | `false` | no |
| <a name="input_blob_storage_encryption_algorithm"></a> [blob\_storage\_encryption\_algorithm](#input\_blob\_storage\_encryption\_algorithm) | Algorithm used for encrypting the default bucket. | `string` | `"AES256"` | no |
| <a name="input_blob_storage_encryption_key_arn"></a> [blob\_storage\_encryption\_key\_arn](#input\_blob\_storage\_encryption\_key\_arn) | ARN of the key used to encrypt the bucket. Only needed if you set aws:kms as encryption algorithm. | `string` | `null` | no |
| <a name="input_blob_storage_force_destroy"></a> [blob\_storage\_force\_destroy](#input\_blob\_storage\_force\_destroy) | Force destroy for mlfoundry s3 bucket | `bool` | `true` | no |
| <a name="input_blob_storage_override_name"></a> [blob\_storage\_override\_name](#input\_blob\_storage\_override\_name) | S3 bucket name. Only used if s3\_enable\_override is enabled | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_feature_blob_storage_enabled"></a> [feature\_blob\_storage\_enabled](#input\_feature\_blob\_storage\_enabled) | Enable blob storage feature in the platform | `bool` | `true` | no |
| <a name="input_feature_docker_registry_enabled"></a> [feature\_docker\_registry\_enabled](#input\_feature\_docker\_registry\_enabled) | Enable docker registry feature in the platform | `bool` | `true` | no |
| <a name="input_feature_secrets_enabled"></a> [feature\_secrets\_enabled](#input\_feature\_secrets\_enabled) | Enable secrets manager feature in the platform | `bool` | `true` | no |
| <a name="input_platform_feature_enabled"></a> [platform\_feature\_enabled](#input\_platform\_feature\_enabled) | Enable platform features like docker registry, secrets manager and blob storage | `bool` | `true` | no |
| <a name="input_platform_user_force_destroy"></a> [platform\_user\_force\_destroy](#input\_platform\_user\_force\_destroy) | Enable force destroy of the user | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_platform_user_access_key"></a> [platform\_user\_access\_key](#output\_platform\_user\_access\_key) | The user access key ID |
| <a name="output_platform_user_arn"></a> [platform\_user\_arn](#output\_platform\_user\_arn) | The user IAM resource arn |
| <a name="output_platform_user_bucket_arn"></a> [platform\_user\_bucket\_arn](#output\_platform\_user\_bucket\_arn) | The bucket's arn |
| <a name="output_platform_user_bucket_name"></a> [platform\_user\_bucket\_name](#output\_platform\_user\_bucket\_name) | The bucket's ID/name |
| <a name="output_platform_user_ecr_url"></a> [platform\_user\_ecr\_url](#output\_platform\_user\_ecr\_url) | The ECR url to connect |
| <a name="output_platform_user_name"></a> [platform\_user\_name](#output\_platform\_user\_name) | The user's name |
| <a name="output_platform_user_secret_key"></a> [platform\_user\_secret\_key](#output\_platform\_user\_secret\_key) | The user secret key |
| <a name="output_policy_arns"></a> [policy\_arns](#output\_policy\_arns) | The list of ARNs of policies directly assigned to the IAM user |
<!-- END_TF_DOCS -->