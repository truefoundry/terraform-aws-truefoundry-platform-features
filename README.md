# terraform-aws-truefoundry-platform-features
Truefoundry AWS platform features

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.57 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.57 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_truefoundry_bucket"></a> [truefoundry\_bucket](#module\_truefoundry\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.15.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.truefoundry_platform_user_keys](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.truefoundry_platform_feature_cluster_integration_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_parameter_store_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.truefoundry_platform_feature_secrets_manager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.truefoundry_platform_feature_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_cluster_integration_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_ecr_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_parameter_store_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_s3_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.truefoundry_platform_secrets_manager_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.truefoundry_platform_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_additional_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_cluster_integration_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_ecr_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_parameter_store_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_s3_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.truefoundry_platform_user_secrets_manager_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_cluster_integration_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_ecr_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_parameter_store_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_s3_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.truefoundry_platform_feature_secrets_manager_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account id | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_blob_storage_attach_deny_insecure_transport_policy"></a> [blob\_storage\_attach\_deny\_insecure\_transport\_policy](#input\_blob\_storage\_attach\_deny\_insecure\_transport\_policy) | Attach deny insecure transport policy to the bucket | `bool` | `true` | no |
| <a name="input_blob_storage_attach_policy"></a> [blob\_storage\_attach\_policy](#input\_blob\_storage\_attach\_policy) | Attach policy to the bucket | `bool` | `true` | no |
| <a name="input_blob_storage_attach_public_policy"></a> [blob\_storage\_attach\_public\_policy](#input\_blob\_storage\_attach\_public\_policy) | Attach public policy to the bucket | `bool` | `true` | no |
| <a name="input_blob_storage_attach_require_latest_tls_policy"></a> [blob\_storage\_attach\_require\_latest\_tls\_policy](#input\_blob\_storage\_attach\_require\_latest\_tls\_policy) | Attach require latest TLS policy to the bucket | `bool` | `true` | no |
| <a name="input_blob_storage_block_public_acls"></a> [blob\_storage\_block\_public\_acls](#input\_blob\_storage\_block\_public\_acls) | Block public ACLs | `bool` | `true` | no |
| <a name="input_blob_storage_block_public_policy"></a> [blob\_storage\_block\_public\_policy](#input\_blob\_storage\_block\_public\_policy) | Block public policy | `bool` | `true` | no |
| <a name="input_blob_storage_cors_origins"></a> [blob\_storage\_cors\_origins](#input\_blob\_storage\_cors\_origins) | List of CORS origins for Mlfoundry bucket | `list(string)` | <pre>[<br/>  "*"<br/>]</pre> | no |
| <a name="input_blob_storage_enable_override"></a> [blob\_storage\_enable\_override](#input\_blob\_storage\_enable\_override) | Enable overriding the name of s3 bucket. This will only be used if feature\_blob\_storage\_enabled is enabled. You need to pass blob\_storage\_override\_name to pass the bucket name | `bool` | `false` | no |
| <a name="input_blob_storage_encryption_algorithm"></a> [blob\_storage\_encryption\_algorithm](#input\_blob\_storage\_encryption\_algorithm) | Algorithm used for encrypting the default bucket. | `string` | `"AES256"` | no |
| <a name="input_blob_storage_encryption_key_arn"></a> [blob\_storage\_encryption\_key\_arn](#input\_blob\_storage\_encryption\_key\_arn) | ARN of the key used to encrypt the bucket. Only needed if you set aws:kms as encryption algorithm. | `string` | `null` | no |
| <a name="input_blob_storage_extra_tags"></a> [blob\_storage\_extra\_tags](#input\_blob\_storage\_extra\_tags) | Extra tags for the s3 bucket | `map(string)` | `{}` | no |
| <a name="input_blob_storage_force_destroy"></a> [blob\_storage\_force\_destroy](#input\_blob\_storage\_force\_destroy) | Force destroy for mlfoundry s3 bucket | `bool` | `true` | no |
| <a name="input_blob_storage_ignore_public_acls"></a> [blob\_storage\_ignore\_public\_acls](#input\_blob\_storage\_ignore\_public\_acls) | Ignore public ACLs | `bool` | `true` | no |
| <a name="input_blob_storage_override_name"></a> [blob\_storage\_override\_name](#input\_blob\_storage\_override\_name) | S3 bucket name. Only used if s3\_enable\_override is enabled | `string` | `""` | no |
| <a name="input_blob_storage_restrict_public_buckets"></a> [blob\_storage\_restrict\_public\_buckets](#input\_blob\_storage\_restrict\_public\_buckets) | Restrict public buckets | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_control_plane_roles"></a> [control\_plane\_roles](#input\_control\_plane\_roles) | Control plane roles that can assume your platform role | `list(string)` | <pre>[<br/>  "arn:aws:iam::416964291864:role/tfy-ctl-euwe1-production-truefoundry-deps"<br/>]</pre> | no |
| <a name="input_disable_default_tags"></a> [disable\_default\_tags](#input\_disable\_default\_tags) | Disable default tags | `bool` | `false` | no |
| <a name="input_feature_blob_storage_enabled"></a> [feature\_blob\_storage\_enabled](#input\_feature\_blob\_storage\_enabled) | Enable blob storage feature in the platform | `bool` | `true` | no |
| <a name="input_feature_cluster_integration_enabled"></a> [feature\_cluster\_integration\_enabled](#input\_feature\_cluster\_integration\_enabled) | Enable cluster integration feature in the platform | `bool` | `true` | no |
| <a name="input_feature_docker_registry_enabled"></a> [feature\_docker\_registry\_enabled](#input\_feature\_docker\_registry\_enabled) | Enable docker registry feature in the platform | `bool` | `true` | no |
| <a name="input_feature_parameter_store_enabled"></a> [feature\_parameter\_store\_enabled](#input\_feature\_parameter\_store\_enabled) | Enable parameter store feature in the platform | `bool` | `true` | no |
| <a name="input_feature_secrets_manager_enabled"></a> [feature\_secrets\_manager\_enabled](#input\_feature\_secrets\_manager\_enabled) | Enable secrets manager feature in the platform | `bool` | `false` | no |
| <a name="input_flyte_propeller_serviceaccount_name"></a> [flyte\_propeller\_serviceaccount\_name](#input\_flyte\_propeller\_serviceaccount\_name) | Name for the Flyte Propeller service account | `string` | `"flytepropeller"` | no |
| <a name="input_flyte_propeller_serviceaccount_namespace"></a> [flyte\_propeller\_serviceaccount\_namespace](#input\_flyte\_propeller\_serviceaccount\_namespace) | Namespace for the Flyte Propeller service account | `string` | `"tfy-workflow-propeller"` | no |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | OIDC provider URL | `string` | `""` | no |
| <a name="input_platform_features_additional_policy_arns"></a> [platform\_features\_additional\_policy\_arns](#input\_platform\_features\_additional\_policy\_arns) | Additional policy ARNs to attach to the platform role or platform user | `list(string)` | `[]` | no |
| <a name="input_platform_features_iam_policy_prefix_enable_override"></a> [platform\_features\_iam\_policy\_prefix\_enable\_override](#input\_platform\_features\_iam\_policy\_prefix\_enable\_override) | Enable overriding the IAM policy prefix. If enabled, you need to pass platform\_features\_iam\_policy\_prefix\_override\_name to pass the prefix | `bool` | `false` | no |
| <a name="input_platform_features_iam_policy_prefix_override_name"></a> [platform\_features\_iam\_policy\_prefix\_override\_name](#input\_platform\_features\_iam\_policy\_prefix\_override\_name) | Prefix for the IAM policy. If empty, the default prefix will be used. Only used if platform\_features\_iam\_policy\_prefix\_enable\_override is enabled | `string` | `""` | no |
| <a name="input_platform_role_enable_override"></a> [platform\_role\_enable\_override](#input\_platform\_role\_enable\_override) | Enable overriding the platform role name. You need to pass blob\_storage\_override\_name to pass the bucket name | `bool` | `false` | no |
| <a name="input_platform_role_enabled"></a> [platform\_role\_enabled](#input\_platform\_role\_enabled) | Enable creation of a platform feature IAM role | `bool` | `true` | no |
| <a name="input_platform_role_override_name"></a> [platform\_role\_override\_name](#input\_platform\_role\_override\_name) | Platform IAM role name which will have access to S3 bucket, SSM and ECR | `string` | `""` | no |
| <a name="input_platform_role_permissions_boundary_arn"></a> [platform\_role\_permissions\_boundary\_arn](#input\_platform\_role\_permissions\_boundary\_arn) | ARN of the permissions boundary to apply to the platform role | `string` | `null` | no |
| <a name="input_platform_user_enabled"></a> [platform\_user\_enabled](#input\_platform\_user\_enabled) | Enable creation of a platform feature user | `bool` | `false` | no |
| <a name="input_platform_user_force_destroy"></a> [platform\_user\_force\_destroy](#input\_platform\_user\_force\_destroy) | Enable force destroy of the user | `bool` | `true` | no |
| <a name="input_platform_user_name_override_enabled"></a> [platform\_user\_name\_override\_enabled](#input\_platform\_user\_name\_override\_enabled) | Enable overriding the platform user name. You need to pass platform\_user\_override\_name to pass the user name | `bool` | `false` | no |
| <a name="input_platform_user_override_name"></a> [platform\_user\_override\_name](#input\_platform\_user\_override\_name) | Username to override the default platform feature user | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blob_storage_uri"></a> [blob\_storage\_uri](#output\_blob\_storage\_uri) | URI of the S3 bucket |
| <a name="output_platform_bucket_arn"></a> [platform\_bucket\_arn](#output\_platform\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_platform_bucket_enabled"></a> [platform\_bucket\_enabled](#output\_platform\_bucket\_enabled) | Flag to enable S3 bucket for the platform |
| <a name="output_platform_bucket_name"></a> [platform\_bucket\_name](#output\_platform\_bucket\_name) | Name/ID of the S3 bucket |
| <a name="output_platform_cluster_integration_enabled"></a> [platform\_cluster\_integration\_enabled](#output\_platform\_cluster\_integration\_enabled) | Flag to enable cluster integration for the platform |
| <a name="output_platform_ecr_enabled"></a> [platform\_ecr\_enabled](#output\_platform\_ecr\_enabled) | Flag to enable ECR for the platform |
| <a name="output_platform_ecr_url"></a> [platform\_ecr\_url](#output\_platform\_ecr\_url) | The ECR url to connect |
| <a name="output_platform_iam_role_arn"></a> [platform\_iam\_role\_arn](#output\_platform\_iam\_role\_arn) | The platform IAM role arn |
| <a name="output_platform_iam_role_assume_role_arns"></a> [platform\_iam\_role\_assume\_role\_arns](#output\_platform\_iam\_role\_assume\_role\_arns) | The role arns that can assume the platform IAM role |
| <a name="output_platform_iam_role_enabled"></a> [platform\_iam\_role\_enabled](#output\_platform\_iam\_role\_enabled) | Flag to enable IAM role for the platform |
| <a name="output_platform_iam_role_policy_arns"></a> [platform\_iam\_role\_policy\_arns](#output\_platform\_iam\_role\_policy\_arns) | The platform IAM role policy arns |
| <a name="output_platform_secrets_manager_enabled"></a> [platform\_secrets\_manager\_enabled](#output\_platform\_secrets\_manager\_enabled) | Flag to enable Secrets Manager for the platform |
| <a name="output_platform_ssm_enabled"></a> [platform\_ssm\_enabled](#output\_platform\_ssm\_enabled) | Flag to enable Parameter Store for the platform |
| <a name="output_platform_user_access_key"></a> [platform\_user\_access\_key](#output\_platform\_user\_access\_key) | The user access key ID |
| <a name="output_platform_user_arn"></a> [platform\_user\_arn](#output\_platform\_user\_arn) | The user IAM resource arn |
| <a name="output_platform_user_enabled"></a> [platform\_user\_enabled](#output\_platform\_user\_enabled) | Flag to enable user for the platform. If false, the iam role will be created. |
| <a name="output_platform_user_secret_key"></a> [platform\_user\_secret\_key](#output\_platform\_user\_secret\_key) | The user secret key |
<!-- END_TF_DOCS -->