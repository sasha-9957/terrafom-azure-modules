output "application_insights" {
  description = "An object containing data created by the insights application module."
  value       = module.application_insights.application_insights
  sensitive   = true
}
