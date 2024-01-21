resource "azurerm_private_dns_ptr_record" "this" {
  for_each = var.azurerm_private_dns_ptr_record_params

  name                = each.value.name                # required
  resource_group_name = each.value.resource_group_name # required
  zone_name           = each.value.zone_name           # required
  ttl                 = each.value.ttl                 # required
  records             = each.value.records             # required
  tags                = each.value.tags
}
