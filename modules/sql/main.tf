resource "azurerm_mssql_server" "main" {
  name                         = "sql-server-${random_string.suffix.result}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = var.aad_admin_object_id
  }
}

resource "azurerm_mssql_database" "main" {
  name      = "webapp-db"
  server_id = azurerm_mssql_server.main.id
  sku_name  = "Basic"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}