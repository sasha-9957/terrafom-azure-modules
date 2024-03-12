output "key_vault_access_policies" {
  description = "An object containing the Key Vaults Access Policies created by the module."
  value       = module.key_vault_access_policy.key_vault_access_policies
}
