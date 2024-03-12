output "application_insights" {
  description = "An object containing data created by the Application Insights module."
  value       = azurerm_application_insights.this
  sensitive   = true
}
