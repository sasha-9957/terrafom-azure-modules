output "key_vault_access_policies" {
  description = "An object containing the Key Vaults Access Policies created by the module."
  value       = azurerm_key_vault_access_policy.this
}
