variable "azurerm_cdn_frontdoor_origin_group_params" {
  description = "Object map for Azure Front Door Origin Group module input parameters."
  type = map(object({
    name                                                      = string # Required
    cdn_frontdoor_profile_id                                  = string # Required
    restore_traffic_time_to_healed_or_new_endpoint_in_minutes = number
    session_affinity_enabled                                  = bool

    load_balancing = list(object({ # Required
      additional_latency_in_milliseconds = number
      sample_size                        = number
      successful_samples_required        = number
    }))

    health_probe = list(object({
      protocol            = string # Required
      interval_in_seconds = number # Required
      request_type        = string
      path                = string
    }))
  }))
}
