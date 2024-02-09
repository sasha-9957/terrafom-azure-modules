resource "azurerm_private_dns_txt_record" "this" {
  for_each            = var.azurerm_private_dns_txt_record_params

  name                = each.value.name                # required
  resource_group_name = each.value.resource_group_name # required
  zone_name           = each.value.zone_name           # required
  ttl                 = each.value.ttl                 # required
  tags                = each.value.tags

  dynamic "record" {
    iterator = r
    for_each = each.value.record

    content {
      value = r.value.value # required
    }
  }
}
