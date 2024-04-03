output "storage_accounts" {
  description = "An object containing the Storage Accounts created by the module."
  sensitive   = true
  value       = module.storage_account.storage_accounts
}
