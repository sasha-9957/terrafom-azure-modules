output "front_door_endpoints" {
  description = "An object containing the Azure Front Door Endpoints created by the module."
  value       = module.frontdoor_endpoint.frontdoor_endpoints
}
