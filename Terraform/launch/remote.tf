data "terraform_remote_state" "project02-security" {
  backend = "s3"
  config = {
    bucket = "project02-terraform-status"
    key    = "Terraform/security/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
