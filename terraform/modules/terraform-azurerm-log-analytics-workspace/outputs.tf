output "azurerm_log_analytics_workspaces" {
  description = "An object containing the Azure Log Analytics Workspaces created by the module."
  sensitive   = true
  value       = azurerm_log_analytics_workspace.this
}
