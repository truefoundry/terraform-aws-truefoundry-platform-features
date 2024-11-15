# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/outputs.tf

################################################################################
# Iam Role details
################################################################################
output "platform_iam_role_arn" {
  description = "The platform IAM role arn"
  value       = var.platform_feature_enabled ? aws_iam_role.truefoundry_platform_feature_iam_role[0].arn : ""
}

output "platform_iam_role_assume_role_arns" {
  description = "The roles arns that can assume the platform IAM role"
  value       = var.platform_feature_enabled ? var.control_plane_roles : []
}

output "platform_iam_role_policy_arns" {
  description = "The platform IAM role policy arns"
  value       = local.truefoundry_platform_policy_arns
}

output "platform_iam_role_enabled" {
  description = "The platform IAM role is enabled"
  value       = var.platform_feature_enabled
}

################################################################################
# User details
################################################################################

output "platform_user_enabled" {
  description = "The user is enabled"
  value       = var.platform_feature_enabled && var.platform_user_enabled
}

output "platform_user_access_key" {
  description = "The user access key ID"
  value       = var.platform_feature_enabled && var.platform_user_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].id : ""
}

output "platform_user_secret_key" {
  description = "The user secret key"
  value       = var.platform_feature_enabled && var.platform_user_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].secret : ""
  sensitive   = true
}

output "platform_user_arn" {
  description = "The user IAM resource arn"
  value       = var.platform_feature_enabled && var.platform_user_enabled ? aws_iam_user.truefoundry_platform_user[0].arn : ""
}

################################################################################
# Bucket details
################################################################################
output "platform_bucket_name" {
  description = "The bucket's ID/name"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_id : ""
}

output "platform_bucket_arn" {
  description = "The bucket's arn"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_arn : ""
}

output "platform_bucket_enabled" {
  description = "Platform bucket is enabled"
  value = var.platform_feature_enabled && var.feature_blob_storage_enabled
}

################################################################################
# ECR details
################################################################################
output "platform_ecr_url" {
  description = "The ECR url to connect"
  value       = var.feature_docker_registry_enabled ? "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com" : ""
}

output "platform_ecr_enabled" {
  description = "Platform ECR is enabled"
  value       = var.platform_feature_enabled && var.feature_docker_registry_enabled
}

################################################################################
# Secrets Manager details
################################################################################
output "platform_secrets_manager_enabled" {
  description = "Platform Secrets Manager is enabled"
  value       = var.platform_feature_enabled && var.feature_secrets_manager_enabled
}

################################################################################
# Parameter Store details
################################################################################
output "platform_ssm_enabled" {
  description = "Platform Parameter Store is enabled"
  value       = var.platform_feature_enabled && var.feature_parameter_store_enabled
}

################################################################################
# Cluster integration details
################################################################################
output "platform_cluster_integration_enabled" {
  description = "Platform cluster integration is enabled"
  value       = var.platform_feature_enabled && var.feature_cluster_integration_enabled
}
