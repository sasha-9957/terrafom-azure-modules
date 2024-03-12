output "frontdoor_origin_groups" {
  description = "An object containing the Azure Front Door Origin Groupds created by the module."
  value       = azurerm_cdn_frontdoor_origin_group.this
}
