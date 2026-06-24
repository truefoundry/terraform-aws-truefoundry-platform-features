# Plan-only tag propagation test — INFRA-703
# Asserts that caller-supplied tags and the module's built-in defaults
# are present on directly-managed IAM policy resources.

mock_provider "aws" {
  mock_data "aws_eks_cluster" {
    defaults = {
      identity = [
        {
          oidc = [
            {
              issuer = "https://oidc.eks.us-east-1.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE"
            }
          ]
        }
      ]
    }
  }
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
  mock_data "aws_partition" {
    defaults = {
      partition = "aws"
    }
  }
  mock_resource "aws_iam_policy" {
    defaults = {
      arn = "arn:aws:iam::123456789012:policy/mock-policy"
    }
  }
  mock_resource "aws_iam_role" {
    defaults = {
      arn  = "arn:aws:iam::123456789012:role/mock-role"
      name = "mock-role"
    }
  }
}

run "tags_applied" {
  command = plan

  variables {
    cluster_name   = "test"
    aws_account_id = "123456789012"
    aws_region     = "us-east-1"
    tags           = { "cost-center" = "test-123" }
  }

  # Caller tag propagates to the S3 IAM policy (always created by default)
  assert {
    condition     = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["cost-center"] == "test-123"
    error_message = "Expected cost-center=test-123 on truefoundry_platform_feature_s3_policy, got: ${aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["cost-center"]}"
  }

  # Module default tag is present
  assert {
    condition     = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["truefoundry-terraform-module"] == "platform-features"
    error_message = "Expected truefoundry-terraform-module=platform-features on truefoundry_platform_feature_s3_policy, got: ${aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["truefoundry-terraform-module"]}"
  }

  # Module managed tag is present
  assert {
    condition     = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["truefoundry-managed"] == "true"
    error_message = "Expected truefoundry-managed=true on truefoundry_platform_feature_s3_policy, got: ${aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["truefoundry-managed"]}"
  }
}

run "disable_default_tags" {
  command = plan

  variables {
    cluster_name         = "test"
    aws_account_id       = "123456789012"
    aws_region           = "us-east-1"
    tags                 = { "cost-center" = "test-123" }
    disable_default_tags = true
  }

  # Caller tag is still present when default tags are disabled
  assert {
    condition     = aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["cost-center"] == "test-123"
    error_message = "Expected cost-center=test-123 on truefoundry_platform_feature_s3_policy, got: ${aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags["cost-center"]}"
  }

  # truefoundry-terraform-module must be absent when disable_default_tags=true
  assert {
    condition     = !contains(keys(aws_iam_policy.truefoundry_platform_feature_s3_policy[0].tags), "truefoundry-terraform-module")
    error_message = "Expected truefoundry-terraform-module to be absent when disable_default_tags=true"
  }
}
