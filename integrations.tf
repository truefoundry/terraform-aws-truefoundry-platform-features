module "integrations" {
  source = "git::https://github.com/truefoundry/terraform-truefoundry-integrations.git?ref=main"

  cluster_type      = "aws-eks"
  cluster_name      = var.cluster_name
  control_plane_url = var.control_plane_url

  tfy_api_key         = var.tfy_api_key
  trigger_helm_update = var.trigger_helm_update

  aws_region                      = var.aws_region
  aws_role_arn                    = var.aws_role_arn
  aws_account_id                  = var.aws_account_id
  aws_s3_enabled                  = var.aws_s3_enabled
  aws_ecr_enabled                 = var.aws_ecr_enabled
  aws_access_key_id               = var.aws_access_key_id
  aws_s3_bucket_name              = var.aws_s3_bucket_name
  aws_secret_access_key           = var.aws_secret_access_key
  aws_service_account_enabled     = var.aws_service_account_enabled
  aws_parameter_store_enabled     = var.aws_parameter_store_enabled
  aws_secrets_manager_enabled     = var.aws_secrets_manager_enabled
  aws_cluster_integration_enabled = var.aws_cluster_integration_enabled
}
