resource "azurerm_cdn_frontdoor_origin_group" "this" {
  for_each = var.azurerm_cdn_frontdoor_origin_group_params

  name                                                      = each.value.name                     # Required
  cdn_frontdoor_profile_id                                  = each.value.cdn_frontdoor_profile_id # Required
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = each.value.restore_traffic_time_to_healed_or_new_endpoint_in_minutes
  session_affinity_enabled                                  = each.value.session_affinity_enabled

  dynamic "load_balancing" { # Required
    iterator = lb
    for_each = each.value.load_balancing

    content {
      additional_latency_in_milliseconds = lb.value.additional_latency_in_milliseconds
      sample_size                        = lb.value.sample_size
      successful_samples_required        = lb.value.successful_samples_required
    }
  }

  dynamic "health_probe" {
    iterator = hp
    for_each = each.value.health_probe

    content {
      protocol            = hp.value.protocol            # Required
      interval_in_seconds = hp.value.interval_in_seconds # Required
      request_type        = hp.value.request_type
      path                = hp.value.path
    }
  }
}
