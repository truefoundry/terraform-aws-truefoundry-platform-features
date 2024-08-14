# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/variables.tf

################################################################################
# Global
################################################################################

variable "aws_account_id" {
  description = "AWS account id"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "platform_feature_enabled" {
  description = "Enable platform features like docker registry, secrets manager and blob storage"
  type        = bool
  default     = true
}

################################################################################
# Cluster
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

################################################################################
# IAM role
################################################################################

variable "control_plane_roles" {
  description = "Control plane roles that can assume your platform role"
  type        = list(string)
  default     = ["arn:aws:iam::416964291864:role/tfy-ctl-euwe1-production-truefoundry-deps"]
}

variable "platform_role_enable_override" {
  description = "Enable overriding the platform role name. You need to pass s3_override_name to pass the bucket name"
  type        = bool
  default     = false
}

variable "platform_role_override_name" {
  description = "Platform IAM role name which will have access to S3 bucket, SSM and ECR"
  type        = string
  default     = ""
}

################################################################################
# IAM user
################################################################################

variable "platform_user_enabled" {
  description = "Enable creation of a platform feature user"
  type        = bool
  default     = false
}

variable "platform_user_name_override_enabled" {
  description = "Enable overriding the platform user name. You need to pass platform_user_override_name to pass the user name"
  type        = bool
  default     = false
}

variable "platform_user_override_name" {
  description = "Username to override the default platform feature user"
  type        = string
  default     = ""
}

variable "platform_user_force_destroy" {
  description = "Enable force destroy of the user"
  type        = bool
  default     = true
}
################################################################################
# Buckets
################################################################################

variable "feature_blob_storage_enabled" {
  description = "Enable blob storage feature in the platform"
  type        = bool
  default     = true
}

variable "blob_storage_enable_override" {
  description = "Enable overriding the name of s3 bucket. This will only be used if feature_blob_storage_enabled is enabled. You need to pass s3_override_name to pass the bucket name"
  type        = bool
  default     = false
}

variable "blob_storage_override_name" {
  description = "S3 bucket name. Only used if s3_enable_override is enabled"
  type        = string
  default     = ""
}

variable "blob_storage_encryption_algorithm" {
  description = "Algorithm used for encrypting the default bucket."
  type        = string
  default     = "AES256"
}

variable "blob_storage_force_destroy" {
  description = "Force destroy for mlfoundry s3 bucket"
  default     = true
  type        = bool
}

variable "blob_storage_encryption_key_arn" {
  description = "ARN of the key used to encrypt the bucket. Only needed if you set aws:kms as encryption algorithm."
  type        = string
  default     = null
}

variable "blob_storage_cors_origins" {
  description = "List of CORS origins for Mlfoundry bucket"
  type        = list(string)
  default     = ["*"]
}
################################################################################
# Parameter Store
################################################################################
variable "feature_parameter_store_enabled" {
  description = "Enable parameter store feature in the platform"
  type        = bool
  default     = true
}

################################################################################
# Secrets Manager
################################################################################
variable "feature_secrets_manager_enabled" {
  description = "Enable secrets manager feature in the platform"
  type        = bool
  default     = false
}

################################################################################
# ECR
################################################################################
variable "feature_docker_registry_enabled" {
  description = "Enable docker registry feature in the platform"
  type        = bool
  default     = true
}

################################################################################
# Cluster Integration
################################################################################
variable "feature_cluster_integration_enabled" {
  description = "Enable cluster integration feature in the platform"
  type        = bool
  default     = true
}

##################################################################################
## Other variables
##################################################################################

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
