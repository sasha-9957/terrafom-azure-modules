output "frontdoor_profiles" {
  description = "An object containing the Azure Front Door Profiles created by the module."
  value       = azurerm_cdn_frontdoor_profile.this
}
