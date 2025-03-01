provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform-s3" {
  bucket = "demo-tf-test-bucket"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "terraform-dynamodb-table" {
  name           = "demo-tf-test-dynamo-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "UserId"
    type = "S"
  }
}