resource "azurerm_private_dns_zone" "this" {
  for_each = var.azurerm_private_dns_zone_params

  name                = each.value.name                # required
  resource_group_name = each.value.resource_group_name # required
  tags                = each.value.tags

  dynamic "soa_record" {
    iterator = sr
    for_each = each.value.soa_record

    content {
      email        = sr.value.email # required
      expire_time  = sr.value.expire_time
      minimum_ttl  = sr.value.minimum_ttl
      refresh_time = sr.value.refresh_time
      retry_time   = sr.value.retry_time
      ttl          = sr.value.ttl
      tags         = sr.value.tags
    }
  }
}
