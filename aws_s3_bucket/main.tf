resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket to AWS"
    Environment = "Dev"
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
}
