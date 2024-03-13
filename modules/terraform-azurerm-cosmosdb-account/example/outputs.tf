output "cosmosdb_accounts" {
  description = "An object containing the Azure CosmosDB Accounts created by the module."
  value       = module.cosmosdb_account.cosmosdb_accounts
}
