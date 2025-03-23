variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
}

variable "app_service_plan_sku" {
  description = "SKU of the App Service Plan"
  type        = string
}

variable "dotnet_version" {
  description = ".NET version for the Web App"
  type        = string
}

variable "sql_connection_string" {
  sensitive   = true
  description = "Connection string to the SQL database"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}