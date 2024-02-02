output "key_vault_access_policy" {
  description = "An object containing the Key Vaults Access Policy created by the module"
  value = azurerm_key_vault_access_policy.this
}