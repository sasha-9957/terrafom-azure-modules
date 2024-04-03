resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.azurerm_private_dns_zone_virtual_network_link_params

  name                  = each.value.name                  # Required
  private_dns_zone_name = each.value.private_dns_zone_name # Required
  resource_group_name   = each.value.resource_group_name   # Required
  virtual_network_id    = each.value.virtual_network_id    # Required
  registration_enabled  = each.value.registration_enabled
  tags                  = each.value.tags
}
