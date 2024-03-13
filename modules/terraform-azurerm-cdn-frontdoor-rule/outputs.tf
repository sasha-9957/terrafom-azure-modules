output "frontdoor_rules" {
  description = "An object containing the Azure Front Door Rules created by the module."
  value       = azurerm_cdn_frontdoor_rule.this
}
