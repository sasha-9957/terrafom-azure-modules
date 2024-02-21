output "key_vaults" {
  description = "An object containing the Key Vaults created by the module."
  value       = azurerm_key_vault.this
}
