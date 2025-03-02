output "aws_s3_bucket_name" {
  value = aws_s3_bucket.terraform-s3.id
  description = "name of the backend s3 bucket"
}

output "aws_dynamodb_table_name" {
  value = aws_dynamodb_table.terraform-dynamodb-table.id
  description = "Name of the backend dynamodb table"
}
