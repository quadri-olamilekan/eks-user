data "aws_iam_policy_document" "developer" {
  statement {
    sid       = "AllowDeveloper"
    effect    = "Allow"
    actions   = var.developer_actions
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "admin" {
  statement {
    sid       = "AllowAdmin"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
  statement {
    sid    = "AllowPassRole"
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "admin_assume_role" {
  statement {
    sid    = "AllowAccountAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type = "AWS"

      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}

data "aws_iam_policy_document" "admin_role" {
  statement {
    sid    = "AllowMastersAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]

    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/admin-eks-Role"]
  }
}

data "aws_caller_identity" "current" {}
