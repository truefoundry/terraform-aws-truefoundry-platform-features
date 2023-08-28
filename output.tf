# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/outputs.tf

################################################################################
# User creds
################################################################################

output "platform_user_name" {
  description = "The user's name"
  value       = var.platform_feature_enabled ? aws_iam_user.truefoundry_platform_user[0].name : ""
}

output "platform_user_arn" {
  description = "The user IAM resource arn"
  value       = var.platform_feature_enabled ? aws_iam_user.truefoundry_platform_user[0].arn : ""
}

output "platform_user_access_key" {
  description = "The user access key ID"
  value       = var.platform_feature_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].id : ""
}

output "platform_user_secret_key" {
  description = "The user secret key"
  value       = var.platform_feature_enabled ? aws_iam_access_key.truefoundry_platform_user_keys[0].secret : ""
  sensitive   = true
}

output "policy_arns" {
  description = "The list of ARNs of policies directly assigned to the IAM user"
  value       = local.truefoundry_platform_user_policy_arns
}