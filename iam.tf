data "aws_iam_policy_document" "truefoundry_platform_feature_user_s3_policy_document" {
  count = var.platform_feature_enabled ? var.feature_blob_storage_enabled ? 1 : 0 : 0
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
    ]

    resources = [
      module.truefoundry_bucket[0].s3_bucket_arn,
      "${module.truefoundry_bucket[0].s3_bucket_arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "truefoundry_platform_feature_user_ssm_policy_document" {
  count = var.platform_feature_enabled ? var.feature_secrets_enabled ? 1 : 0 : 0
  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:DeleteParameters",
      "ssm:GetParameterHistory"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tfy-secret/*"
    ]
  }
}

data "aws_iam_policy_document" "truefoundry_platform_feature_user_ecr_policy_document" {
  count = var.platform_feature_enabled ? var.feature_docker_registry_enabled ? 1 : 0 : 0
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetRegistryPolicy",
      "ecr:DescribeImageScanFindings",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:CreateRepository",
      "ecr:GetDownloadUrlForLayer",
      "ecr:DescribeImageReplicationStatus",
      "ecr:ListTagsForResource",
      "ecr:BatchGetRepositoryScanningConfiguration",
      "ecr:GetRegistryScanningConfiguration",
      "ecr:PutImage",
      "ecr:BatchGetImage",
      "ecr:DescribeRepositories",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetRepositoryPolicy",
      "ecr:GetLifecyclePolicy",
      "ecr:ListImages",
      "ecr:InitiateLayerUpload",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DeleteRepository",
      "ecr:UploadLayerPart",
    ]

    resources = [
      "arn:aws:ecr:${var.aws_region}:${var.aws_account_id}:repository/tfy-*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "ecr:DescribeRegistry",
      "ecr:GetAuthorizationToken",
      "sts:GetServiceBearerToken"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "truefoundry_platform_feature_user_s3_policy" {
  count       = var.platform_feature_enabled ? var.feature_blob_storage_enabled ? 1 : 0 : 0
  name_prefix = "${local.truefoundry_unique_name}-s3-access"
  description = "IAM policy for TrueFoundry user for platform features blob storage"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_user_s3_policy_document[0].json
  tags        = local.tags
}

resource "aws_iam_policy" "truefoundry_platform_feature_user_ssm_policy" {
  count       = var.platform_feature_enabled ? var.feature_secrets_enabled ? 1 : 0 : 0
  name_prefix = "${local.truefoundry_unique_name}-ssm-access"
  description = "IAM policy for TrueFoundry user for platform features Secrets manager"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_user_ssm_policy_document[0].json
  tags        = local.tags
}

resource "aws_iam_policy" "truefoundry_platform_feature_user_ecr_policy" {
  count       = var.platform_feature_enabled ? var.feature_docker_registry_enabled ? 1 : 0 : 0
  name_prefix = "${local.truefoundry_unique_name}-ecr-access"
  description = "IAM policy for TrueFoundry user for platform features docker registry"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_user_ecr_policy_document[0].json
  tags        = local.tags
}


################################################################################
# IAM role
################################################################################

resource "aws_iam_role" "truefoundry_platform_feature_iam_role" {
  count                 = var.platform_feature_enabled ? 1 : 0
  name                  = "${local.truefoundry_unique_name}-iam-role"
  description           = "IAM role for TrueFoundry to access S3 bucket, SSM and ECR"
  force_detach_policies = true
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [for role in var.control_plane_roles : {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        AWS = role
      }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_user_s3_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_blob_storage_enabled ? 1 : 0 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_s3_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_user_ssm_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_secrets_enabled ? 1 : 0 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_ssm_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_user_ecr_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_docker_registry_enabled ? 1 : 0 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_ecr_policy[0].arn
}