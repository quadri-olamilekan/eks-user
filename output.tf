output "developer_password" {
  value = aws_iam_user_login_profile.Developer_user.*.encrypted_password
  # password | base64 --decode | keybase pgp decrypt
}

output "admin_password" {
  value = aws_iam_user_login_profile.Admin_user.*.encrypted_password
  # password | base64 --decode | keybase pgp decrypt
}