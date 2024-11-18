# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/outputs.tf

################################################################################
# IAM role details
################################################################################
output "platform_iam_role_arn" {
  description = "The platform IAM role arn"
  value       = var.platform_feature_enabled ? aws_iam_role.truefoundry_platform_feature_iam_role[0].arn : ""
}

output "platform_iam_role_assume_role_arns" {
  description = "The role arns that can assume the platform IAM role"
  value       = var.platform_feature_enabled ? var.control_plane_roles : []
}

output "platform_iam_role_policy_arns" {
  description = "The platform IAM role policy arns"
  value       = local.truefoundry_platform_policy_arns
}

output "platform_iam_role_enabled" {
  description = "Flag to enable IAM role for the platform. Either this or or `platform_user_enabled` should be enabled"
  value       = var.platform_feature_enabled
}

################################################################################
# User details
################################################################################

output "platform_user_enabled" {
  description = "Flag to enable user for the platform. Either this or `platform_iam_role_enabled` should be enabled"
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
output "platform_bucket_enabled" {
  description = "Flag to enable S3 bucket for the platform"
  value       = var.platform_feature_enabled && var.feature_blob_storage_enabled
}

output "platform_bucket_name" {
  description = "Name/ID of the S3 bucket"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_id : ""
}

output "platform_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_arn : ""
}

################################################################################
# ECR details
################################################################################
output "platform_ecr_enabled" {
  description = "Flag to enable ECR for the platform"
  value       = var.platform_feature_enabled && var.feature_docker_registry_enabled
}

output "platform_ecr_url" {
  description = "The ECR url to connect"
  value       = var.feature_docker_registry_enabled ? "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com" : ""
}

################################################################################
# Secrets Manager details
################################################################################
output "platform_secrets_manager_enabled" {
  description = "Flag to enable Secrets Manager for the platform"
  value       = var.platform_feature_enabled && var.feature_secrets_manager_enabled
}

################################################################################
# Parameter Store details
################################################################################
output "platform_ssm_enabled" {
  description = "Flag to enable Parameter Store for the platform"
  value       = var.platform_feature_enabled && var.feature_parameter_store_enabled
}

################################################################################
# Cluster integration details
################################################################################
output "platform_cluster_integration_enabled" {
  description = "Flag to enable cluster integration for the platform"
  value       = var.platform_feature_enabled && var.feature_cluster_integration_enabled
}
