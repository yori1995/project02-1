# IAM Role Data
data "aws_iam_instance_profiles" "project02-cd-role" {
  role_name = "project02-codedeploy-ec2-role"
}

# Template file Data
data "template_file" "web_output" {
  template = file("${path.module}/web.sh")
  vars = {
    server_port = "${var.server_port}"
  }
}

# Server Port Variable
variable "server_port" {
  description = "The port will use for HTTP requests"
  type        = number
  default     = 8080
}
