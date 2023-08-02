#SSH Security group
resource "aws_security_group" "project02-ssh" {
  name        = "Project02 SSH Accept"
  description = "for SSH Accept"
  vpc_id      = data.terraform_remote_state.project02-vpc.outputs.vpc-id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Project02 SSH Accept"
  }
}

#WEB Security group
resource "aws_security_group" "project02-web" {
  name        = "Project02 WEB Accept"
  description = "for Web Accept"
  vpc_id      = data.terraform_remote_state.project02-vpc.outputs.vpc-id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Project02 WEB Accept"
  }
}

#ALB Security group
resource "aws_security_group" "project02-alb" {
  name        = "Project02 ALB Accept"
  description = "for ALB Accept"
  vpc_id      = data.terraform_remote_state.project02-vpc.outputs.vpc-id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Project02 ALB Accept"
  }
}
