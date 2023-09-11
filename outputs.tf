output "function_arn" {
  value       = aws_lambda_function.ingestion_function.arn
  description = "Log ingestion lambda function ARN"
}

output "lambda_archive" {
  depends_on = [null_resource.build_lambda]
  value      = local.archive_name
}