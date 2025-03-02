provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform-s3" {
  bucket = "demo-tf-test-newone-bucket"

  lifecycle {
    prevent_destroy = false
  }
}
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.terraform-s3.id
  versioning_configuration {
    status="Enabled"
  } 
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket=aws_s3_bucket.terraform-s3.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
  
}

resource "aws_dynamodb_table" "terraform-dynamodb-table" {
  name           = "demo-tf-test-dynamo-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
