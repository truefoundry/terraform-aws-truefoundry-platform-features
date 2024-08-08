# AWS Platform Features Upgrade Guide
This guide helps in migration from the old terraform modules to the new one.

# Updgrade guide to AWS platform features module from 0.2.x to 0.3.x
1. When upgrading terraform version for platform features ensure that you are running on version `0.2.x` and the platform features is upgraded to the newer 0.3.x version.
2. Update the following variables;
   - `feature_cloud_integration_enabled` to `feature_cluster_integration_enabled`
   - `feature_secrets_enabled` to `feature_parameter_store_enabled`
3. Run `terraform migrate state` to update the state file to the new version.
4. Run `terraform plan` to see the changes that will be applied.
5. Run `terraform apply` to apply the changes.
