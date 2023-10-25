output "developer_password" {
  value = {
    for user, profile in aws_iam_user_login_profile.Developer_user :
    user => {
      username = user
      password = profile.encrypted_password
    }
  }
}

output "admin_password" {
  value = {
    for user, profile in aws_iam_user_login_profile.Admin_user :
    user => {
      username = user
      password = profile.encrypted_password
    }
  }
}

/*
output "developer_password" {
  value = aws_iam_user_login_profile.Developer_user.*.encrypted_password
  # password | base64 --decode | keybase pgp decrypt
}

output "admin_password" {
  value = aws_iam_user_login_profile.Admin_user.*.encrypted_password
  # password | base64 --decode | keybase pgp decrypt
}
*/
