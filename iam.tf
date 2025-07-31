data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "truefoundry_platform_feature_s3_policy_document" {
  count = var.feature_blob_storage_enabled ? 1 : 0
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

data "aws_iam_policy_document" "truefoundry_platform_feature_parameter_store_policy_document" {
  count = var.feature_parameter_store_enabled ? 1 : 0
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
      "arn:${data.aws_partition.current.partition}:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tfy-secret/*"
    ]
  }
}

data "aws_iam_policy_document" "truefoundry_platform_feature_secrets_manager_policy_document" {
  count = var.feature_secrets_manager_enabled ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:CreateSecret",
      "secretsmanager:DeleteSecret",
      "secretsmanager:UpdateSecret",
      "secretsmanager:ListSecrets",
      "secretsmanager:PutSecretValue",
    ]
    resources = [
      "arn:${data.aws_partition.current.partition}:secretsmanager:${var.aws_region}:${var.aws_account_id}:secret:/tfy-secret/*"
    ]
  }
}

data "aws_iam_policy_document" "truefoundry_platform_feature_ecr_policy_document" {
  count = var.feature_docker_registry_enabled ? 1 : 0
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
      "arn:${data.aws_partition.current.partition}:ecr:${var.aws_region}:${var.aws_account_id}:repository/tfy-*"
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

data "aws_iam_policy_document" "truefoundry_platform_feature_cluster_integration_policy_document" {
  count = var.feature_cluster_integration_enabled ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "eks:ListNodegroups",
      "eks:DescribeFargateProfile",
      "eks:ListTagsForResource",
      "eks:DescribeInsight",
      "eks:ListAddons",
      "eks:DescribeAddon",
      "eks:DescribePodIdentityAssociation",
      "eks:ListInsights",
      "eks:ListPodIdentityAssociations",
      "eks:ListFargateProfiles",
      "eks:DescribeNodegroup",
      "eks:ListUpdates",
      "eks:DescribeUpdate",
      "eks:AccessKubernetesApi",
      "eks:DescribeCluster",
    ]

    resources = [
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:fargateprofile/${var.cluster_name}/*/*",
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:addon/${var.cluster_name}/*/*",
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:nodegroup/${var.cluster_name}/*/*",
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:podidentityassociation/${var.cluster_name}/*",
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:identityproviderconfig/${var.cluster_name}/*/*/*",
      "arn:${data.aws_partition.current.partition}:eks:${var.aws_region}:${var.aws_account_id}:cluster/${var.cluster_name}"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "eks:DescribeAddonConfiguration",
      "eks:ListClusters",
      "eks:DescribeAddonVersions",
      "ec2:DescribeRegions"
    ]

    resources = [
      "*"
    ]
  }
}


resource "aws_iam_policy" "truefoundry_platform_feature_s3_policy" {
  count       = var.feature_blob_storage_enabled ? 1 : 0
  name_prefix = "${local.truefoundry_unique_name}-s3-access-"
  description = "IAM policy for TrueFoundry user for platform features blob storage"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_s3_policy_document[0].json
  tags        = local.tags
}

resource "aws_iam_policy" "truefoundry_platform_feature_parameter_store_policy" {
  count       = var.feature_parameter_store_enabled ? 1 : 0
  name_prefix = "${local.truefoundry_unique_name}-parameter-store-access-"
  description = "IAM policy for TrueFoundry user for platform features Secrets manager"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_parameter_store_policy_document[0].json
  tags        = local.tags
}

resource "aws_iam_policy" "truefoundry_platform_feature_secrets_manager_policy" {
  count       = var.feature_secrets_manager_enabled ? 1 : 0
  name_prefix = "${local.truefoundry_unique_name}-secrets-manager-access-"
  description = "IAM policy for TrueFoundry user for platform features Secrets manager"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_secrets_manager_policy_document[0].json
  tags        = local.tags
}

resource "aws_iam_policy" "truefoundry_platform_feature_ecr_policy" {
  count       = var.feature_docker_registry_enabled ? 1 : 0
  name_prefix = "${local.truefoundry_unique_name}-ecr-access-"
  description = "IAM policy for TrueFoundry user for platform features docker registry"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_ecr_policy_document[0].json
  tags        = local.tags
}


resource "aws_iam_policy" "truefoundry_platform_feature_cluster_integration_policy" {
  count       = var.feature_cluster_integration_enabled ? 1 : 0
  name_prefix = "${local.truefoundry_unique_name}-cluster-integration-access-"
  description = "IAM policy for TrueFoundry user for platform features cluster integration"
  policy      = data.aws_iam_policy_document.truefoundry_platform_feature_cluster_integration_policy_document[0].json
  tags        = local.tags
}

################################################################################
# IAM role
################################################################################

resource "aws_iam_role" "truefoundry_platform_feature_iam_role" {
  count                 = var.platform_user_enabled ? 0 : 1
  name                  = var.platform_role_enable_override ? var.platform_role_override_name : null
  description           = "IAM role for TrueFoundry platform to access S3 bucket, SSM, ECR and EKS"
  name_prefix           = var.platform_role_enable_override ? null : local.iam_role_name_prefix
  force_detach_policies = true

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = concat(
      [for role in var.control_plane_roles : {
        Sid    = ""
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = role
        }
      }],
      [
        {
          Effect = "Allow"
          Action = "sts:AssumeRoleWithWebIdentity"
          Principal = {
            Federated = "arn:${data.aws_partition.current.partition}:iam::${var.aws_account_id}:oidc-provider/${local.oidc_provider_url}"
          }
          Condition = {
            StringEquals = {
              "${local.oidc_provider_url}:aud" = "sts.amazonaws.com"
              "${local.oidc_provider_url}:sub" = "system:serviceaccount:${var.flyte_propeller_serviceaccount_namespace}:${var.flyte_propeller_serviceaccount_name}"
            }
          }
        }
      ]
    )
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_s3_policy_attachment" {
  count      = var.feature_blob_storage_enabled && !var.platform_user_enabled ? 1 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_parameter_store_policy_attachment" {
  count      = var.feature_parameter_store_enabled && !var.platform_user_enabled ? 1 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_parameter_store_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_secrets_manager_policy_attachment" {
  count      = var.feature_secrets_manager_enabled && !var.platform_user_enabled ? 1 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_secrets_manager_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_ecr_policy_attachment" {
  count      = var.feature_docker_registry_enabled && !var.platform_user_enabled ? 1 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_ecr_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "truefoundry_platform_cluster_integration_policy_attachment" {
  count      = var.feature_cluster_integration_enabled && !var.platform_user_enabled ? 1 : 0
  role       = aws_iam_role.truefoundry_platform_feature_iam_role[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_cluster_integration_policy[0].arn
}


################################################################################
# IAM user
################################################################################
resource "aws_iam_user" "truefoundry_platform_user" {
  count = var.platform_user_enabled ? 1 : 0

  name          = var.platform_user_name_override_enabled ? var.platform_user_override_name : "${local.truefoundry_unique_name}-user"
  path          = "/truefoundry/"
  force_destroy = var.platform_user_force_destroy
  tags          = local.tags
}

resource "aws_iam_access_key" "truefoundry_platform_user_keys" {
  count = var.platform_user_enabled ? 1 : 0

  user = aws_iam_user.truefoundry_platform_user[0].name
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_s3_policy_attachment" {
  count      = var.feature_blob_storage_enabled && var.platform_user_enabled ? 1 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_parameter_store_policy_attachment" {
  count      = var.feature_parameter_store_enabled && var.platform_user_enabled ? 1 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_parameter_store_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_secrets_manager_policy_attachment" {
  count      = var.feature_secrets_manager_enabled && var.platform_user_enabled ? 1 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_secrets_manager_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_ecr_policy_attachment" {
  count      = var.feature_docker_registry_enabled && var.platform_user_enabled ? 1 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_ecr_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "truefoundry_platform_user_cluster_integration_policy_attachment" {
  count      = var.feature_cluster_integration_enabled && var.platform_user_enabled ? 1 : 0
  user       = aws_iam_user.truefoundry_platform_user[0].name
  policy_arn = aws_iam_policy.truefoundry_platform_feature_cluster_integration_policy[0].arn
}
