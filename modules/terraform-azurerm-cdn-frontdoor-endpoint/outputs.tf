output "frontdoor_endpoints" {
  description = "An object containing the Azure Front Door Endpoints created by the module."
  value       = azurerm_cdn_frontdoor_endpoint.this
}
