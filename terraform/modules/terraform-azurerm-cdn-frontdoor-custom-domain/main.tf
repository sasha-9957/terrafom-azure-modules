resource "azurerm_cdn_frontdoor_custom_domain" "this" {
  for_each = var.azurerm_cdn_frontdoor_custom_domain_params

  name                     = each.value.name                     # Required
  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id # Required
  host_name                = each.value.host_name                # Required
  dns_zone_id              = each.value.dns_zone_id

  dynamic "tls" { # Required
    iterator = t
    for_each = each.value.tls

    content {
      certificate_type        = t.value.certificate_type
      minimum_tls_version     = t.value.minimum_tls_version
      cdn_frontdoor_secret_id = t.value.cdn_frontdoor_secret_id
    }
  }
}
