output "plan_id" {
  value = azurerm_service_plan.main.id
}

output "app_id" {
  value = azurerm_windows_web_app.main.id
}

output "default_hostname" {
  value = azurerm_windows_web_app.main.default_hostname
}