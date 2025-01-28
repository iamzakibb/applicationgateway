resource "azurerm_log_analytics_workspace" "main" {
  name                = "logs-${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
}

resource "azurerm_application_insights" "main" {
  name                = "appinsights-${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = "web"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}