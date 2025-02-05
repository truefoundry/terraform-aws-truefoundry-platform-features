locals {
  tags = merge(
    {
      "terraform-module" = "platform-features"
      "terraform"        = "true"
      "cluster-name"     = var.cluster_name
    },
    var.tags
  )
  truefoundry_unique_name = "${var.cluster_name}-platform"
  bucket_name             = var.blob_storage_enable_override ? lower(var.blob_storage_override_name) : lower("${var.cluster_name}-ml")
  policy_arns = [
    var.feature_blob_storage_enabled ? aws_iam_policy.truefoundry_platform_feature_s3_policy[0].arn : null,
    var.feature_parameter_store_enabled ? aws_iam_policy.truefoundry_platform_feature_parameter_store_policy[0].arn : null,
    var.feature_secrets_manager_enabled ? aws_iam_policy.truefoundry_platform_feature_secrets_manager_policy[0].arn : null,
    var.feature_docker_registry_enabled ? aws_iam_policy.truefoundry_platform_feature_ecr_policy[0].arn : null,
  ]
  truefoundry_platform_policy_arns = [for arn in local.policy_arns : tostring(arn) if arn != null]

  oidc_provider_url    = var.oidc_provider_url != "" ? replace(var.oidc_provider_url, "https://", "") : replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")
  iam_role_name_prefix = trimsuffix(substr("${local.truefoundry_unique_name}-iam-role-", 0, 37), "-")
}
