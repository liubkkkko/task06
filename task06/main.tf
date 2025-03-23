# Data source to get existing Key Vault
data "azurerm_key_vault" "existing" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# SQL Module
module "sql" {
  source = "./modules/sql"

  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  sql_server_name          = local.sql_server_name
  sql_database_name        = local.sql_db_name
  sql_fw_rule_name         = local.sql_fw_rule_name
  sql_admin_username       = var.sql_admin_username
  allowed_ip_address       = var.allowed_ip_address
  key_vault_id             = data.azurerm_key_vault.existing.id
  kv_secret_admin_name     = local.kv_secret_admin_name
  kv_secret_admin_password = local.kv_secret_admin_password
  sql_db_service_model     = local.sql_db_service_model
  tags                     = var.tags

  depends_on = [
    azurerm_resource_group.main
  ]
}

# WebApp Module
module "webapp" {
  source = "./modules/webapp"

  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  app_service_plan_name = local.asp_name
  web_app_name          = local.app_name
  app_service_plan_sku  = local.app_service_plan_sku
  dotnet_version        = local.dotnet_version
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags

  depends_on = [
    module.sql
  ]
}