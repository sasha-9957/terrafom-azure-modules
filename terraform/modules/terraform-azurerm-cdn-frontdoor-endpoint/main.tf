resource "azurerm_cdn_frontdoor_endpoint" "this" {
  for_each = var.azurerm_cdn_frontdoor_endpoint_params

  name                     = each.value.name                     # Required
  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id # Required
  enabled                  = each.value.enabled
  tags                     = each.value.tags
}
