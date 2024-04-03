output "application_insights" {
  description = "An object containing data created by the Application Insights module."
  value       = module.application_insights.application_insights
  sensitive   = true
}
