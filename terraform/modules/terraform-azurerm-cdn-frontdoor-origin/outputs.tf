output "frontdoor_origins" {
  description = "An object containing the Azure Front Door Origins created by the module."
  value       = azurerm_cdn_frontdoor_origin.this
}
