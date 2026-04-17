output "bucket_id" {
  description = "Name of the transactions S3 bucket"
  value       = aws_s3_bucket.transactions.id
}

output "bucket_arn" {
  description = "ARN of the transactions S3 bucket"
  value       = aws_s3_bucket.transactions.arn
}
