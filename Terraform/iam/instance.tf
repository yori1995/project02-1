resource "aws_iam_instance_profile" "jenkins-profile" {
  name = "jenkins-profile"
  role = aws_iam_role.project02-role-web.name
}
