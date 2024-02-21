output "storage_accounts" {
  description = "An object containing the Storage Accounts created by the module."
  value       = azurerm_storage_account.this
  sensitive   = true
}
