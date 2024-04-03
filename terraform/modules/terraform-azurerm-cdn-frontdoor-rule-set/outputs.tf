output "frontdoor_rule_sets" {
  description = "An object containing the Azure Front Door Rule Sets created by the module."
  value       = azurerm_cdn_frontdoor_rule_set.this
}
