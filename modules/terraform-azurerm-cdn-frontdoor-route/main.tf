resource "azurerm_cdn_frontdoor_route" "this" {
  for_each = var.azurerm_cdn_frontdoor_route_params

  name                            = each.value.name                          # Required
  cdn_frontdoor_endpoint_id       = each.value.cdn_frontdoor_endpoint_id     # Required
  cdn_frontdoor_origin_group_id   = each.value.cdn_frontdoor_origin_group_id # Required
  cdn_frontdoor_origin_ids        = each.value.cdn_frontdoor_origin_ids      # Required
  forwarding_protocol             = each.value.forwarding_protocol
  patterns_to_match               = each.value.patterns_to_match   # Required
  supported_protocols             = each.value.supported_protocols # Required
  cdn_frontdoor_custom_domain_ids = each.value.cdn_frontdoor_custom_domain_ids
  cdn_frontdoor_origin_path       = each.value.cdn_frontdoor_origin_path
  cdn_frontdoor_rule_set_ids      = each.value.cdn_frontdoor_rule_set_ids
  enabled                         = each.value.enabled
  https_redirect_enabled          = each.value.https_redirect_enabled
  link_to_default_domain          = each.value.link_to_default_domain

  dynamic "cache" {
    iterator = c
    for_each = each.value.cache

    content {
      query_string_caching_behavior = each.value.query_string_caching_behavior
      query_strings                 = each.value.query_strings
      compression_enabled           = each.value.compression_enabled
      content_types_to_compress     = each.value.content_types_to_compress
    }
  }
}
