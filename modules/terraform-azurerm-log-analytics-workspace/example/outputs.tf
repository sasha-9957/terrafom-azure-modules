output "azurerm_log_analytics_workspaces" {
  description = "An object containing the Azure Log Analytics Workspace created by the module."
  value       = module.azurerm_log_analytics_workspace.azurerm_log_analytics_workspaces
  sensitive   = true
}
