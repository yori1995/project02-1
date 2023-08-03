resource "aws_instance" "project02-bastion" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  key_name                    = "project02-key"
  vpc_security_group_ids      = [data.terraform_remote_state.project02-security.outputs.ssh-security]
  subnet_id                   = data.terraform_remote_state.project02-vpc.outputs.public-subnet2a
  associate_public_ip_address = true

  tags = {
    Name = "project02-bastion-instance"
  }
}

resource "aws_iam_instance_profile" "jenkins-profile" {
  name = "jenkins-profile"
  role = data.aws_iam_instance_profiles.project02-role-web.role_name
}

resource "aws_instance" "project02-jenkins" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t3.large"
  key_name                    = "project02-key"
  vpc_security_group_ids      = [data.terraform_remote_state.project02-security.outputs.web-security, data.terraform_remote_state.project02-security.outputs.ssh-security]
  subnet_id                   = data.terraform_remote_state.project02-vpc.outputs.private-subnet2a
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.jenkins-profile.name

  tags = {
    Name = "project02-jenkins-instance"
  }
}
