data "aws_secretmanager_secret" "rds_password" {
    name = "main/rds/password"
}

data "aws_secretmanager_secret_version" "rds_password" {
    secret_id = data.aws_secretmanager_secret.rds_password.id
}

locals {
    rds_password = jsondecode(data.aws_secretmanager_secret_version.rds_password.secret_string) ["password"]
}

