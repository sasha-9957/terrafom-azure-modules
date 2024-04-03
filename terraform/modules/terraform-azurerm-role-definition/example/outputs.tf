output "azurerm_role_definitions" {
  description = "An object containing the Azure Role Definitions created by the module."
  value       = module.role_definition.role_definitions
}
