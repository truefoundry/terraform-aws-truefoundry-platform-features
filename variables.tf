# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/variables.tf

################################################################################
# Global
################################################################################
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
# IAM user
################################################################################

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
  description = "Enable overriding name of s3 bucket. This will only be used if feature_blob_storage_enabled is enabled. You need to pass s3_override_name to pass the bucket name"
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
  default     = false
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
# SSM
################################################################################
variable "feature_secrets_enabled" {
  description = "Enable secrets manager feature in the platform"
  type        = bool
  default     = true
}


################################################################################
# ECR
################################################################################
variable "feature_docker_registry_enabled" {
  description = "Enable docker registry feature in the platform"
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