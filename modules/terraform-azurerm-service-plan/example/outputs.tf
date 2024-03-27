output "service_plans" {
  description = "An object containing data created by the Azure Service Plan module."
  value       = module.service_plan.service_plans
}
