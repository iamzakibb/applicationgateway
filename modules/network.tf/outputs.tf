output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "gateway_subnet_id" {
  value = azurerm_subnet.gateway.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}

output "sql_subnet_id" {
  value = azurerm_subnet.sql.id
}