variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the SQL server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the SQL database"
  type        = string
}

variable "sql_fw_rule_name" {
  description = "Name of the SQL firewall rule"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL admin username"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to connect to SQL server"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the key vault to store secrets"
  type        = string
}

variable "kv_secret_admin_name" {
  description = "Name of the key vault secret for SQL admin username"
  type        = string
}

variable "kv_secret_admin_password" {
  description = "Name of the key vault secret for SQL admin password"
  type        = string
}

variable "sql_db_service_model" {
  description = "Service model for SQL database"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}