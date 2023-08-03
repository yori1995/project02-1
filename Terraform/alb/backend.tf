terraform {
  backend "s3" {
    bucket = "project02-terraform-bucket"
    key    = "Terraform/alb/terraform.tfstate"
    region = "ap-northeast-2"

    dynamodb_table = "project02-terraform-locks"
    encrypt        = true
  }
}
