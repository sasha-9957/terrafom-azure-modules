resource "azurerm_private_dns_cname_record" "this" {
  for_each = var.azurerm_private_dns_cname_record_params

  name                = each.value.name                # required
  resource_group_name = each.value.resource_group_name # required
  zone_name           = each.value.zone_name           # required
  ttl                 = each.value.ttl                 # required
  record              = each.value.record              # required
  tags                = each.value.tags
}
