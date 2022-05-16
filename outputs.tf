output "secret-arn" {
  description = "Secret ARN: "
  value       = aws_secretsmanager_secret.secret.arn
}
