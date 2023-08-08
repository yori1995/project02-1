data "aws_iam_instance_profiles" "project02-cd-role" {
  role_name = "project02-code-deploy-ec2-role"
}

data "template_file" "web_output" {
  template = file("${path.module}/web.sh")
  vars = {
    server_port = "${var.server_port}"
  }
}

variable "server_port" {
  description = "The port will use for HTTP requests"
  type        = number
  default     = 8080
}
