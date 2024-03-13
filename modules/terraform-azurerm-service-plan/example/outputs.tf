output "azurerm_service_plans" {
  description = "An object containing data created by the Azure Service Plan module."
  value       = module.azurerm_service_plan.azurerm_service_plans
}
