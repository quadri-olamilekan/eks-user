variable "developer" {
  type        = list(string)
  default     = ["Development", "Production"]
  description = "value"
}

variable "admin" {
  type        = list(string)
  default     = ["Development1", "Production1"]
  description = "value"
}

variable "env" {
  type    = list(any)
  default = ["Development", "Production"]
}

variable "developer_eks_user_tags" {
  type = map(string)
  default = {
    Department = "developer_eks_user"
  }
  description = "value"
}

variable "eks_developer_group" {
  type    = string
  default = "developer"
}

variable "dev_aws_iam_group_membership_name" {
  type    = string
  default = "dev-group-membership"
}

variable "admin_aws_iam_group_membership_name" {
  type    = string
  default = "masters-group-membership"
}

variable "eks_masters_group" {
  type    = string
  default = "masters"
}

variable "admin_eks_user_tags" {
  type = map(string)
  default = {
    Department = "admin_eks_user"
  }
  description = "value"
}

variable "tags" {
  type = map(string)
  default = {
    Env = "Production"
  }
}

variable "pgp_key" {
  type        = string
  default     = "keybase:quadribello41"
  description = "PGP key for user login profiles"
}

variable "developer_actions" {
  type = list(string)
  default = [
    "eks:DescribeNodegroup",
    "eks:ListNodegroups",
    "eks:DescribeCluster",
    "eks:ListClusters",
    "eks:AccessKubernetesApi",
    "ssm:GetParameter",
    "eks:ListUpdates",
    "eks:ListFargateProfiles",
  ]
  description = "value"
}
