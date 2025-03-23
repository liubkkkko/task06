output "app_hostname" {
  description = "Linux Web App hostname"
  value       = azurerm_linux_web_app.main.default_hostname
}