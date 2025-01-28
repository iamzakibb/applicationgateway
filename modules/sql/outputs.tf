output "server_name" {
  value = azurerm_mssql_server.main.name
}

output "database_id" {
  value = azurerm_mssql_database.main.id
}