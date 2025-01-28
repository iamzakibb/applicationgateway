output "web_app_url" {
  value = module.web_app.default_hostname
}

output "sql_server_name" {
  value = module.sql.server_name
}

output "storage_account_names" {
  value = module.storage.account_names
}

output "app_gateway_public_ip" {
  value = module.app_gateway.public_ip_address
}

output "app_insights_key" {
  value     = module.monitoring.instrumentation_key
  sensitive = true
}