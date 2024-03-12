output "private_endpoints" {
  description = "An object containing the Azure Private Endpoints created by the module."
  value       = module.private_endpoint.private_endpoints
}
