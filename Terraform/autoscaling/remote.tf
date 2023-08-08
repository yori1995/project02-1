data "terraform_remote_state" "project02-vpc" {
  backend = "s3"
  config = {
    bucket = "project02-terraform-status"
    key    = "Terraform/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

data "terraform_remote_state" "project02-launch" {
  backend = "s3"
  config = {
    bucket = "project02-terraform-status"
    key    = "Terraform/launch/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
