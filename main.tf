provider "aws" {
  region = var.aws_region
}

data "local_sensitive_file" "file" {
  filename = var.file_path
}

resource "aws_secretsmanager_secret" "secret" {
  name = var.secret_name
  tags = {
    "Owner"   = var.owner
    "Created" = "via Terraform"
  }
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = data.local_sensitive_file.file.content
}
