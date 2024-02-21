resource "azurerm_private_dns_txt_record" "this" {
  for_each = var.azurerm_private_dns_txt_record_params

  name                = each.value.name                # Required
  resource_group_name = each.value.resource_group_name # Required
  zone_name           = each.value.zone_name           # Required
  ttl                 = each.value.ttl                 # Required
  tags                = each.value.tags

  dynamic "record" { # Required
    iterator = r
    for_each = each.value.record

    content {
      value = r.value.value # Required
    }
  }
}
