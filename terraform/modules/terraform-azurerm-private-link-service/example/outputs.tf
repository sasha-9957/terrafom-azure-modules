output "private_link_services" {
  description = "An object containing the Private Link Services created by the module."
  value       = module.private_link_service.private_link_services
}
