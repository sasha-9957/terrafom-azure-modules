output "azurerm_cdn_frontdoor_routes" {
  description = "An object containing the Azure Front Door Routes created by the module."
  value       = module.frontdoor_route.frontdoor_routes
}
