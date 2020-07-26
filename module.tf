locals {
  secrets = tomap({
    for secret in var.secrets: base64encode(secret["path"]) => secret
  })
}

resource "aws_secretsmanager_secret" "secret" {
  for_each = local.secrets

  name = "${var.base_path}${each.value["path"]}"
  description = each.value["description"]
  recovery_window_in_days = 0

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  for_each = local.secrets

  secret_id = aws_secretsmanager_secret.secret[each.key].id
  secret_string = each.value["secret"]

  lifecycle {
    prevent_destroy = false
  }
}
