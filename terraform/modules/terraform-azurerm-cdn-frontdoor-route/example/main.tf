module "frontdoor_route" {
  source  = "app.terraform.io/captionhealth/front-door-route/azurerm"
  version = "1.0.0"

  azurerm_cdn_frontdoor_route_params = {
    frontdoor_route1 = {
      name                            = "route1"                                                                            # Required
      cdn_frontdoor_endpoint_id       = module.frontdoor_endpoint.frontdoor_endpoints["front_door_endpoint1"].id            # Required
      cdn_frontdoor_origin_group_id   = module.frontdoor_origin_group.frontdoor_origin_groups["frontdoor_origin_group1"].id # Required
      cdn_frontdoor_origin_ids        = [module.frontdoor_origin.frontdoor_origin["frontdoor_origin1"].id]                  # Required
      forwarding_protocol             = "HttpsOnly"
      patterns_to_match               = ["/*"]            # Required
      supported_protocols             = ["Http", "Https"] # Required
      cdn_frontdoor_custom_domain_ids = each.value.cdn_frontdoor_custom_domain_ids
      cdn_frontdoor_origin_path       = each.value.cdn_frontdoor_origin_path
      cdn_frontdoor_rule_set_ids      = [module.frontdoor_rule_set.frontdoor_rule_sets["frontdoor_rule_set1"].id]
      enabled                         = true
      https_redirect_enabled          = true
      link_to_default_domain          = false

      cache = [
        {
          query_string_caching_behavior = "IgnoreSpecifiedQueryStrings"
          query_strings                 = ["account", "settings"]
          compression_enabled           = true
          content_types_to_compress     = ["text/html", "text/javascript", "text/xml"]
        }
      ]
    }
  }
}
