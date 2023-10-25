# Developer User Login Profiles
resource "aws_iam_user_login_profile" "Developer_user" {
  for_each                = aws_iam_user.developer_eks_user
  user                    = aws_iam_user.developer_eks_user[each.key].name
  password_reset_required = true
  pgp_key                 = "keybase:quadribello41"
}

# Admin User Login Profiles
resource "aws_iam_user_login_profile" "Admin_user" {
  for_each                = aws_iam_user.admin_eks_user
  user                    = aws_iam_user.admin_eks_user[each.key].name
  password_reset_required = true
  pgp_key                 = "keybase:quadribello41"
}

# Developer Users
resource "aws_iam_user" "developer_eks_user" {
  for_each      = toset(var.developer)
  name          = each.key
  force_destroy = true

  tags = {
    Department = "developer_eks_user"
  }
}

# Admin Users
resource "aws_iam_user" "admin_eks_user" {
  for_each      = toset(var.admin)
  name          = each.key
  force_destroy = true

  tags = {
    Department = "admin_eks_user"
  }
}

# EKS Developer Group
resource "aws_iam_group" "eks_developer" {
  name = "Developer"
}

resource "aws_iam_group_policy" "developer_policy" {
  name   = "developer"
  group  = aws_iam_group.eks_developer.name
  policy = data.aws_iam_policy_document.developer.json
}

resource "aws_iam_group_membership" "db_team" {
  name  = "dev-group-membership"
  users = [for user in aws_iam_user.developer_eks_user : user.name]
  group = aws_iam_group.eks_developer.name
}

# EKS Admin Group
resource "aws_iam_group" "eks_masters" {
  name = "Masters"
}

resource "aws_iam_group_policy" "masters_policy" {
  name   = "masters"
  group  = aws_iam_group.eks_masters.name
  policy = data.aws_iam_policy_document.masters_role.json
}

resource "aws_iam_group_membership" "masters_team" {
  name  = "masters-group-membership"
  users = [for user in aws_iam_user.admin_eks_user : user.name]
  group = aws_iam_group.eks_masters.name
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_role" "masters" {
  name               = "Masters-eks-Role"
  assume_role_policy = data.aws_iam_policy_document.masters_assume_role.json
}


resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.masters.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

resource "aws_iam_policy" "eks_admin" {
  name   = "eks-masters"
  policy = data.aws_iam_policy_document.masters.json
}