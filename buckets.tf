module "truefoundry_bucket" {
  count   = var.platform_feature_enabled ? var.feature_blob_storage_enabled ? 1 : 0 : 0
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"

  bucket        = var.blob_storage_enable_override ? var.blob_storage_override_name : null
  bucket_prefix = var.blob_storage_enable_override ? null : trimsuffix(substr(local.truefoundry_unique_name, 0, 37), "-")

  force_destroy = var.blob_storage_force_destroy

  tags = merge(
    {
      Name = var.blob_storage_enable_override ? var.blob_storage_override_name : trimsuffix(substr(local.truefoundry_unique_name, 0, 37), "-")
    },
    local.tags
  )


  # Bucket policies
  attach_policy                         = true
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    status     = true
    mfa_delete = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = var.blob_storage_encryption_key_arn
        sse_algorithm     = var.blob_storage_encryption_algorithm
      }
    }
  }

  intelligent_tiering = {
    general = {
      status = "Enabled"
      tiering = {
        ARCHIVE_ACCESS = {
          days = 90
        }
      }
    }
  }

  lifecycle_rule = [
    {
      id      = "abort-multipart-uploads-tfy-rule"
      status  = "Enabled"
      prefix  = ""
      enabled = true

      abort_incomplete_multipart_upload_days = 7
    }
  ]

  cors_rule = [
    {
      allowed_methods = ["GET", "POST", "PUT"]
      allowed_origins = var.blob_storage_cors_origins
      allowed_headers = ["*"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
    }
  ]
}