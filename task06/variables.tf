variable "name_pattern" {
  description = "Naming pattern for all resources"
  type        = string
  default     = "cmaz-13f58f43-mod6"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "key_vault_rg_name" {
  description = "Name of the resource group containing the key vault"
  type        = string
  default     = "cmaz-13f58f43-mod6-kv-rg"
}

variable "key_vault_name" {
  description = "Name of the key vault to store secrets"
  type        = string
  default     = "cmaz-13f58f43-mod6-kv"
}

variable "sql_admin_username" {
  description = "SQL admin username"
  type        = string
  default     = "sqladmin"
}

variable "allowed_ip_address" {
  description = "IP address allowed to connect to SQL server"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "liubomyr_puliak@epam.com"
  }
}