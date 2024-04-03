resource "azurerm_cdn_frontdoor_origin" "this" {
  for_each = var.azurerm_cdn_frontdoor_origin_params

  name                           = each.value.name                           # Required
  cdn_frontdoor_origin_group_id  = each.value.cdn_frontdoor_origin_group_id  # Required
  host_name                      = each.value.host_name                      # Required
  certificate_name_check_enabled = each.value.certificate_name_check_enabled # Required
  enabled                        = each.value.enabled
  http_port                      = each.value.http_port
  https_port                     = each.value.https_port
  origin_host_header             = each.value.origin_host_header
  priority                       = each.value.priority
  weight                         = each.value.weight

  dynamic "private_link" {
    iterator = pl
    for_each = each.value.private_link

    content {
      request_message        = pl.value.request_message
      target_type            = pl.value.target_type
      location               = pl.value.location               # Required
      private_link_target_id = pl.value.private_link_target_id # Required

    }

  }
}
