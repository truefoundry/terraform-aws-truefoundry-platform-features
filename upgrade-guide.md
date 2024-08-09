# AWS Platform Features Upgrade Guide
This guide helps in migration from the old terraform modules to the new one.

# Updgrade guide to AWS platform features module from 0.2.2 to 0.3.0
1. When upgrading terraform version for platform features ensure that you are running on version `0.2.x` and the platform features is upgraded to the newer 0.3.x version.
2. Update the following variables;
   - `feature_secrets_enabled` to `feature_parameter_store_enabled`
3. Run `terraform state mv old_resource_name new_resource_name` to move the resources to the new name. Run the following commands to update state;
```bash
   terraform state mv module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_ecr_policy_attachment module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_ecr_policy_attachment
   terraform state mv module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_ssm_policy_attachment module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_parameter_store_policy_attachment
   terraform state mv module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_cluster_integration_policy_attachment module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_cluster_integration_policy_attachment
   terraform state mv module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_s3_policy_attachment module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_s3_policy_attachment
   
   terraform state mv module.<module-name>.aws_iam_policy.truefoundry_platform_feature_user_ecr_policy module.<module-name>.aws_iam_policy.truefoundry_platform_feature_ecr_policy
   terraform state mv module.<module-name>.aws_iam_policy.truefoundry_platform_feature_user_ssm_policy module.<module-name>.aws_iam_policy.truefoundry_platform_feature_parameter_store_policy
   terraform state mv module.<module-name>.aws_iam_policy.truefoundry_platform_feature_user_s3_policy module.<module-name>.aws_iam_policy.truefoundry_platform_feature_s3_policy
```
4. Run `terraform plan` to see the changes that will be applied. 
5. Run `terraform apply` to apply the changes.


# Updgrade guide to AWS platform features module from 0.2.1 to 0.2.2
1. When upgrading terraform version for platform features ensure that you are running on version `0.2.x` and the platform features is upgraded to the newer 0.2.2 version.
2. Update the following variables;
   - `feature_cloud_integration_enabled` to `feature_cluster_integration_enabled`
3. Run `terraform state mv old_resource_name new_resource_name` to move the resources to the new name. Run the following commands to update state;
```bash
  terraform state mv module.<module-name>.aws_iam_policy.truefoundry_platform_feature_cloud_integration_policy module.<module-name>.aws_iam_policy.truefoundry_platform_feature_cluster_integration_policy
  terraform state mv module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_cloud_integration_policy_attachment module.<module-name>.aws_iam_role_policy_attachment.truefoundry_platform_user_cluster_integration_policy_attachment
```
4. Run `terraform plan` to see the changes that will be applied.
5. Run `terraform apply` to apply the changes.
