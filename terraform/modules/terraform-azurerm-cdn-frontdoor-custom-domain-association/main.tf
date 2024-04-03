resource "azurerm_cdn_frontdoor_custom_domain_association" "this" {
  for_each = var.azurerm_cdn_frontdoor_custom_domain_association_params

  cdn_frontdoor_custom_domain_id = each.value.cdn_frontdoor_custom_domain_id # Required
  cdn_frontdoor_route_ids        = each.value.cdn_frontdoor_route_ids        # Required
}
