data "aws_vpc" "project02-vpc" {
  filter {
    name   = "tag:Name"
    values = ["project02-vpc"]
  }
}
