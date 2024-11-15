module "integrations" {
  source = "git::https://github.com/truefoundry/terraform-truefoundry-integrations.git?ref=v0.1.0-rc.3"

  count = var.aws_cluster_integration_enabled ? 1 : 0

  cluster_type      = "aws-eks"
  cluster_name      = var.cluster_name
  control_plane_url = var.control_plane_url

  tfy_api_key         = var.tfy_api_key
  trigger_helm_update = var.trigger_helm_update

  aws_region                      = var.aws_region
  aws_role_arn                    = var.control_plane_roles
  aws_account_id                  = var.aws_account_id
  aws_s3_enabled                  = var.feature_blob_storage_enabled
  aws_ecr_enabled                 = var.feature_docker_registry_enabled
  aws_access_key_id               = var.aws_access_key_id
  aws_secret_access_key           = var.aws_secret_access_key
  aws_service_account_enabled     = var.aws_service_account_enabled
  aws_parameter_store_enabled     = var.feature_parameter_store_enabled
  aws_secrets_manager_enabled     = var.feature_secrets_manager_enabled
  aws_cluster_integration_enabled = var.aws_cluster_integration_enabled
}
