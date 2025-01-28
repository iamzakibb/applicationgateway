output "public_ip_address" {
  value = azurerm_public_ip.gateway.ip_address
}

output "gateway_id" {
  value = azurerm_application_gateway.main.id
}