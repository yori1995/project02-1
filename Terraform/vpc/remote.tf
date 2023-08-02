data "terraform_remote_state" "project02-ec2" {
  backend = "s3"
  config = {
    bucket = "project02-terraform"
    key    = "Terraform/ec2/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
