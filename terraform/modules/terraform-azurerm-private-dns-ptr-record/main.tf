resource "azurerm_private_dns_ptr_record" "this" {
  for_each = var.azurerm_private_dns_ptr_record_params

  name                = each.value.name                # Required
  resource_group_name = each.value.resource_group_name # Required
  zone_name           = each.value.zone_name           # Required
  ttl                 = each.value.ttl                 # Required
  records             = each.value.records             # Required
  tags                = each.value.tags
}
