output "key_vaults" {
  description = "An object containing the Key Vaults created by the module."
  value       = module.key_vault.key_vaults
}

output "key_vault_access_policies" {
  description = "An object containing the Key Vaults Access Policies created by the module."
  value       = module.key_vault_access_policy.key_vault_access_policies
}

output "service_plans" {
  description = "An object containing data created by the Azure Service Plan module."
  value       = module.azurerm_service_plan.service_plans
}

output "storage_accounts" {
  description = "An object containing the Storage Accounts created by the module."
  sensitive   = true
  value       = module.storage_account.storage_accounts
}

output "virtual_networks" {
  description = "An object containing the Virtual Networks created by the module."
  value       = module.virtual_network.virtual_networks
}

output "subnets" {
  description = "An object containing the Azure Subnets created by the module."
  value       = module.subnet.subnets
}

output "linux_function_apps" {
  description = "An object containing the Azure Linux Function apps created by the module."
  value       = module.linux_function_app.linux_function_apps
  sensitive   = true
}

output "application_insights" {
  description = "An object containing data created by the Application Insights module."
  value       = module.app_insights.application_insights
  sensitive   = true
}
