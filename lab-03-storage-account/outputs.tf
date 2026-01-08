output "storage_account_name" {
  value = azurerm_storage_account.lab3_sa.name
}

output "storage_account_primary_endpoint" {
  value = azurerm_storage_account.lab3_sa.primary_blob_endpoint
}
