# SSH 보안그룹 Output
output "ssh-security" {
  value = aws_security_group.project02-ssh.id
}

# WEB 보안그룹 Output
output "web-security" {
  value = aws_security_group.project02-web.id
}

# ALB 보안그룹 Output
output "alb-security" {
  value = aws_security_group.project02-alb.id
}
