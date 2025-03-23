# Generate random password for SQL admin
resource "random_password" "sql_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Store SQL admin username in Key Vault
resource "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.kv_secret_admin_name
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id
}

# Store SQL admin password in Key Vault
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.kv_secret_admin_password
  value        = random_password.sql_admin_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_server" "main" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_admin_password.result
  minimum_tls_version          = "1.2"
  public_network_access_enabled = true
  
  # Add this if you're still having issues
  connection_policy = "Default"
  
  tags = var.tags
  
  identity {
    type = "SystemAssigned"
  }
  
  # Add timeouts for slower operations
  timeouts {
    create = "60m"
    read   = "5m"
    update = "60m"
    delete = "60m"
  }
}

# Create SQL Database
resource "azurerm_mssql_database" "main" {
  name       = var.sql_database_name
  server_id  = azurerm_mssql_server.main.id
  sku_name   = var.sql_db_service_model
  tags       = var.tags
  depends_on = [azurerm_mssql_server.main]
}

# Allow Azure services to connect to SQL Server
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  depends_on       = [azurerm_mssql_server.main]
}

# Allow specific IP address to connect to SQL Server
resource "azurerm_mssql_firewall_rule" "allow_ip" {
  name             = var.sql_fw_rule_name
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
  depends_on       = [azurerm_mssql_server.main]
}