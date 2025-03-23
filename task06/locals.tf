locals {
  rg_name                  = format("%s-rg", var.name_pattern)
  sql_server_name          = format("%s-sql", var.name_pattern)
  sql_db_name              = format("%s-sql-db", var.name_pattern)
  asp_name                 = format("%s-asp", var.name_pattern)
  app_name                 = format("%s-app", var.name_pattern)
  sql_fw_rule_name         = "allow-verification-ip"
  kv_secret_admin_name     = "sql-admin-name"
  kv_secret_admin_password = "sql-admin-password"
  sql_db_service_model     = "S2"
  app_service_plan_sku     = "P0v3"
  dotnet_version           = "8.0"
}