output "frontdoor_custom_domains" {
  description = "An object containing the Azure Front Door Custom Domains created by the module."
  value       = azurerm_cdn_frontdoor_custom_domain.this
}
