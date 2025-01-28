output "account_names" {
  value = [for sa in azurerm_storage_account.main : sa.name]
}

output "account_ids" {
  value = [for sa in azurerm_storage_account.main : sa.id]
}