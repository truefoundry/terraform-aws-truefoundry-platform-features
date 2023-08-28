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
      "*"
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
      "ecr:DescribeRegistry",
      "ecr:DescribeImageReplicationStatus",
      "ecr:GetAuthorizationToken",
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
      "sts:GetServiceBearerToken"
    ]

    resources = [
      "*"
    ]
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
# IAM user
################################################################################

resource "aws_iam_user" "truefoundry_platform_user" {
  count = var.platform_feature_enabled ? 1 : 0

  name          = "${local.truefoundry_unique_name}-user"
  path          = "/truefoundry/"
  force_destroy = var.platform_user_force_destroy
  tags          = local.tags
}


resource "aws_iam_access_key" "truefoundry_platform_user_keys" {
  count = var.platform_feature_enabled ? 1 : 0

  user = aws_iam_user.truefoundry_platform_user[0].name
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_s3_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_blob_storage_enabled ? 1 : 0 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_s3_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_ssm_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_secrets_enabled ? 1 : 0 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_ssm_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_ecr_policy_attachment" {
  count      = var.platform_feature_enabled ? var.feature_docker_registry_enabled ? 1 : 0 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_user_ecr_policy[0].arn
}