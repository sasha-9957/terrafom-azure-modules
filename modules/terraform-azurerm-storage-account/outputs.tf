output "storage_accounts" {
  value     = azurerm_storage_account.this
  sensitive = true
}
