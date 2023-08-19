# S3 bucket arn output 
output "s3_bucket_arn" {
  value       = aws_s3_bucket.project02-tf.arn
  description = "The ARN of the S3 bucket"
}

# Dynamodb name output
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.project02-dynamodb.name
  description = "The name of the DynamoDB table"
}
