output "key_vaults" {
  description = "An object containing the Key Vaults created by the module."
  value       = module.key_vault.key_vaults
}
