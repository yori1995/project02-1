data "terraform_remote_state" "project02-vpc" {
  backend = "s3"
  config = {
    bucket = "project02-terraform"
    key    = "Terraform/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
