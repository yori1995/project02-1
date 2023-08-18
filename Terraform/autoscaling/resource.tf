provider "aws" {
  region = "ap-northeast-2"
}

# AWS auto scaling group create
resource "aws_autoscaling_group" "project02-auto" {
  vpc_zone_identifier = [data.terraform_remote_state.project02-vpc.outputs.private-subnet2a, data.terraform_remote_state.project02-vpc.outputs.private-subnet2c]
  name                = "PROJECT02-AUTOSCALING-GROUP"
  desired_capacity    = 3
  min_size            = 3
  max_size            = 3

  target_group_arns = ["arn:aws:elasticloadbalancing:ap-northeast-2:257307634175:targetgroup/project02-target-group/50679348fbb51772"]
  health_check_type = "ELB"

  launch_template {
    id      = data.terraform_remote_state.project02-launch.outputs.project02-launch
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "PROJECT02-AUTOSCALING-GROUP"
    propagate_at_launch = true
  }
}
