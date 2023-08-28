locals {
  tags = merge(
    {
      "terraform-module" = "platform-features"
      "terraform"        = "true"
      "cluster-name"     = var.cluster_name
    },
    var.tags
  )
  truefoundry_unique_name = var.blob_storage_enable_override ? var.blob_storage_override_name : var.cluster_name
  policy_arns = [
    var.feature_blob_storage_enabled ? aws_iam_policy.truefoundry_platform_feature_user_s3_policy[0].arn : null,
    var.feature_secrets_enabled ? aws_iam_policy.truefoundry_platform_feature_user_ssm_policy[0].arn : null,
    var.feature_docker_registry_enabled ? aws_iam_policy.truefoundry_platform_feature_user_ecr_policy[0].arn : null,
  ]
  truefoundry_platform_user_policy_arns = [for arn in local.policy_arns : tostring(arn) if arn != null]
}