resource "aws_instance" "project02-bastion" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  key_name                    = "subin-key"
  vpc_security_group_ids      = [data.terraform_remote_state.project02-security.outputs.ssh-security]
  subnet_id                   = data.terraform_remote_state.project02-vpc.outputs.public-subnet2a
  associate_public_ip_address = true

  tags = {
    Name = "project02-bastion-instance"
  }
}

resource "aws_instance" "project02-jenkins" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  key_name                    = "subin-key"
  vpc_security_group_ids      = [data.terraform_remote_state.project02-security.outputs.web-security, data.terraform_remote_state.project02-security.outputs.ssh-security]
  private_ip                  = "10.2.1.10"
  subnet_id                   = data.terraform_remote_state.project02-vpc.outputs.private-subnet2a
  associate_public_ip_address = false
  iam_instance_profile        = data.terraform_remote_state.project02-iam.outputs.jenkins-profile

  tags = {
    Name = "project02-jenkins-instance"
  }
}
