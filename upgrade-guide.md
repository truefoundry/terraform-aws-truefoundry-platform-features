# AWS Platform Features Upgrade Guide
This guide helps in migration from the old terraform modules to the new one.

# Updgrade guide to AWS platform features module from 0.2.x to 0.3.x
1. When upgrading terraform version for platform features ensure that you are running on version `0.2.x` and the platform features is upgraded to the newer 0.3.x version.
2. Update the following variables;
   - `feature_cloud_integration_enabled` to `feature_cluster_integration_enabled`
   - `feature_secrets_enabled` to `feature_parameter_store_enabled`
3. Run `terraform state list` to list all the resources that will be affected by the upgrade.
4. Run `terraform state mv old_resource_name new_resource_name` to move the resources to the new name.
5. Run `terraform plan` to see the changes that will be applied.
6. Run `terraform apply` to apply the changes.
