output "ssh-security" {
  value = aws_security_group.project02-ssh.id
}

output "web-security" {
  value = aws_security_group.project02-web.id
}

output "alb-security" {
  value = aws_security_group.project02-alb.id
}
