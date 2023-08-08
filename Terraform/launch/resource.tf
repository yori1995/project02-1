provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_launch_template" "project02-launch" {
  name                   = "project02-launch-template"
  image_id               = "ami-0339565c5bde06e6a"
  instance_type          = "t2.micro"
  key_name               = "project02-key"
  vpc_security_group_ids = [data.terraform_remote_state.project02-security.outputs.web-security, data.terraform_remote_state.project02-security.outputs.ssh-security]
  user_data              = base64encode(data.template_file.web_output.rendered)

  iam_instance_profile {
    name = aws_iam_instance_profile.jenkins-profile-launch.name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_instance_profile" "jenkins-profile-launch" {
  name = "jenkins-profile-launch"
  role = data.aws_iam_instance_profiles.project02-cd-role.role_name
}
