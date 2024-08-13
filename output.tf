# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/outputs.tf

################################################################################
# User details
################################################################################

output "platform_iam_role_name" {
  description = "Then name of the IAM role"
  value       = var.platform_feature_enabled ? aws_iam_role.truefoundry_platform_feature_iam_role[0].name : ""
}

output "platform_iam_role_arn" {
  description = "The IAM role resource arn"
  value       = var.platform_feature_enabled ? aws_iam_role.truefoundry_platform_feature_iam_role[0].arn : ""
}

output "platform_iam_role_assume_role_arns" {
  description = "The IAM role arns which has been assume by platform_iam_role"
  value       = var.platform_feature_enabled ? var.control_plane_roles : []
}

output "platform_iam_role_policy_arns" {
  description = "The list of ARNs of policies directly assigned to the IAM user"
  value       = local.truefoundry_platform_policy_arns
}

output "platform_user_access_key" {
  description = "The user access key ID"
  value       = var.platform_feature_enabled && var.platform_feature_user_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].id : ""
}

output "platform_user_secret_key" {
  description = "The user secret key"
  value       = var.platform_feature_enabled && var.platform_feature_user_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].secret : ""
  sensitive   = true
}

output "platform_user_arn" {
  description = "The user IAM resource arn"
  value       = var.platform_feature_enabled && var.platform_feature_user_enabled ? aws_iam_user.truefoundry_platform_user[0].arn : ""
}

################################################################################
# Bucket details
################################################################################
output "platform_user_bucket_name" {
  description = "The bucket's ID/name"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_id : ""
}

output "platform_user_bucket_arn" {
  description = "The bucket's arn"
  value       = var.feature_blob_storage_enabled ? module.truefoundry_bucket[0].s3_bucket_arn : ""
}

################################################################################
# ECR details
################################################################################
output "platform_user_ecr_url" {
  description = "The ECR url to connect"
  value       = var.feature_docker_registry_enabled ? "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com" : ""
}
