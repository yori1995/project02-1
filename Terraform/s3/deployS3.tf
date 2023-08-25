# S3 bucket 생성
resource "aws_s3_bucket" "project02-tf-d" {
  bucket = "project02-deploy"

# 강제 삭제 방지
# lifecycle {
#    prevent_destroy = true
#  }

# 강제 삭제 가능
  force_destroy = true

# 버전 관리
  versioning {
    enabled = true
  }

# 알고리즘 설정
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "project02-deploy"
  }
}

# S3 bucket 접근 권한 설정
resource "aws_s3_bucket_public_access_block" "public_access_d" {
  bucket                  = aws_s3_bucket.project02-tf-d.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Dynamodb table 생성
resource "aws_dynamodb_table" "project02-dynamodb-d" {
  name         = "project02-deploy-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
