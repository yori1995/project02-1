output "web-role" {
  value = aws_iam_role.project02-role-web.name
}

output "cd-service-role" {
  value = aws_iam_role.project02-cds-role.name
}

output "cd-ec2-role" {
  value = aws_iam_role.project02-cde-role.name
}

output "jenkins-profile" {
	value = aws_iam_instance_profile.jenkins-profile.name
}
