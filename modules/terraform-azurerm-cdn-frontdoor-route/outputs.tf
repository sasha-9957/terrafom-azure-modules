output "azurerm_cdn_frontdoor_routes" {
  description = "An object containing the Azure Front Door Routes created by the module."
  value       = azurerm_cdn_frontdoor_route.this
}
