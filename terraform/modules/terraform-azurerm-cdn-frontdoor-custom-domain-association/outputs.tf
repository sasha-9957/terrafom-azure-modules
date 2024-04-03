output "frontdoor_custom_domain_associations" {
  description = "An object containing the Azure Front Door Custom Domain Associations created by the module."
  value       = azurerm_cdn_frontdoor_custom_domain_association.this
}
