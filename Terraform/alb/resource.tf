resource "aws_lb" "project02-lb" {
  name               = "project02-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.project02-security.outputs.alb-security]
  subnets = [data.terraform_remote_state.project02-vpc.outputs.public-subnet2a,
  data.terraform_remote_state.project02-vpc.outputs.public-subnet2c]
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "project02-lb"
  }
}
