resource "azurerm_cdn_frontdoor_profile" "this" {
  for_each = var.azurerm_cdn_frontdoor_profile_params

  name                     = each.value.name                # Required
  resource_group_name      = each.value.resource_group_name # Required
  sku_name                 = each.value.sku_name            # Required
  response_timeout_seconds = each.value.response_timeout_seconds
  tags                     = each.value.tags
}
