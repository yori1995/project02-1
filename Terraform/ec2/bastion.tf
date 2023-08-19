# Provider
provider "aws" {
  region = "ap-northeast-2"
}

# Bastion Instance 생성
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
