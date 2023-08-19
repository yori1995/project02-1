# VPC Remote
data "terraform_remote_state" "project02-vpc" {
  backend = "s3"
  config = {
    bucket = "project02-terraform-status"
    key    = "Terraform/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

# Security Remote
data "terraform_remote_state" "project02-security" {
  backend = "s3"
  config = {
    bucket = "project02-terraform-status"
    key    = "Terraform/security/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
