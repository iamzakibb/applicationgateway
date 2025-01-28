resource "azurerm_storage_account" "main" {
  for_each = toset(var.storage_accounts)

  name                     = "${each.value}${random_string.suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}