resource "azurerm_cdn_frontdoor_rule_set" "this" {
  for_each = var.azurerm_cdn_frontdoor_rule_set_params

  name                     = each.value.name                     # Required
  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id # Required
}
