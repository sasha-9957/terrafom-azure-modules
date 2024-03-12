variable "azurerm_cdn_frontdoor_route_params" {
  description = "Object map for Azure Front Door Route module input parameters."
  type = map(object({
    name                            = string       # Required
    cdn_frontdoor_endpoint_id       = string       # Required
    cdn_frontdoor_origin_group_id   = string       # Required
    cdn_frontdoor_origin_ids        = list(string) # Required
    forwarding_protocol             = string
    patterns_to_match               = list(string) # Required
    supported_protocols             = set(string)  # Required
    cdn_frontdoor_custom_domain_ids = set(string)
    cdn_frontdoor_origin_path       = string
    cdn_frontdoor_rule_set_ids      = set(string)
    enabled                         = bool
    https_redirect_enabled          = bool
    link_to_default_domain          = bool

    cache = list(object({
      query_string_caching_behavior = string
      query_strings                 = list(string)
      compression_enabled           = bool
      content_types_to_compress     = list(string)
    }))
  }))
}
