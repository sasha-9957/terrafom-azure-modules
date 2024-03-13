module "frontdoor_rule" {
  source  = "app.terraform.io/captionhealth/front-door-rule/azurerm"
  version = "1.0.0"

  # The Rules module must include a depends_on meta-argument which references the azurerm_cdn_frontdoor_origin and the azurerm_cdn_frontdoor_origin_group.
  depends_on = [module.frontdoor_origin_group, module.frontdoor_origin]

  azurerm_cdn_frontdoor_rule_params = {
    frontdoor_rule1 = {
      name                      = "examplerule"                                                        # Required
      cdn_frontdoor_rule_set_id = module.frontdoor_rule_set.frontdoor_rule_sets["frontdoor_rule_set1"] # Required
      order                     = 1                                                                    # Required
      behavior_on_match         = null

      actions = [ # Required
        {
          url_rewrite_action = [
            # {
            #   source_pattern          = "/oldpath/*" # Required
            #   destination             = "/newpath/"  # Required
            #   preserve_unmatched_path = null
            # }
          ]
        },
        {
          url_redirect_action = [
            # {
            #   redirect_type        = "PermanentRedirect" # Required
            #   destination_hostname = "contoso.com"       # Required
            #   redirect_protocol    = null
            #   destination_path     = null
            #   query_string         = null
            #   destination_fragment = null
            # }
          ]
        },
        {
          route_configuration_override_action = [
            # {
            #   cache_duration                = null
            #   cdn_frontdoor_origin_group_id = null
            #   forwarding_protocol           = null
            #   query_string_caching_behavior = null
            #   query_string_parameters       = null # Required query_string_caching_behavior is set to IncludeSpecifiedQueryStrings or IgnoreSpecifiedQueryStrings
            #   compression_enabled           = null
            #   cache_behavior                = null
            # }
          ]
        },
        {
          request_header_action = [
            # {
            #   header_action = "Delete"          # Required
            #   header_name   = "X-Custom-Header" # Required
            #   value         = null              # Required if the header_action is set to Append or Overwrite
            # }
          ]
        },
        {
          response_header_action = [
            # {
            #   header_action = "Overwrite"         # Required
            #   header_name   = "X-Response-Header" # Required
            #   value         = ["ResponseValue"]   # Requiredis required if the header_action is set to Append or Overwrite
            # }
          ]
        }
      ]

      conditions = [
        {
          remote_address_condition = [
            # {
            #   operator         = null
            #   negate_condition = null
            #   match_values     = null
            # }
          ]
        },
        {
          request_method_condition = [
            # {
            #   match_values     = ["GET", "POST"] # Required
            #   operator         = null
            #   negate_condition = null
            # }
          ]
        },
        {
          query_string_condition = [
            # {
            #   operator         = "Any" # Required
            #   negate_condition = null
            #   match_values     = null
            #   transforms       = null
            # }
          ]
        },
        {
          post_args_condition = [
            # {
            #   post_args_name   = "customerName" # Required
            #   operator         = "BeginsWith"   # Required
            #   negate_condition = null
            #   match_values     = ["J", "K"]
            #   transforms       = ["Uppercase"]
            # }
          ]
        },
        {
          request_uri_condition = [
            # {
            #   operator         = "Any" # Required
            #   negate_condition = null
            #   match_values     = null
            #   transforms       = null
            # }
          ]
        },
        {
          request_header_condition = [
            # {
            #   header_name      = "X-Custom-Header" # Required
            #   operator         = "Any"             # Required
            #   negate_condition = null
            #   match_values     = null
            #   transforms       = null
            # }
          ]
        },
        {
          request_body_condition = [
            # {
            #   operator         = "Any"                  # Required
            #   match_values     = ["exampleRequestBody"] # Required
            #   negate_condition = null
            #   transforms       = null
            # }
          ]
        },
        {
          request_scheme_condition = [
            {
              operator         = null
              negate_condition = null
              match_values     = null
            }
          ]
        },
        {
          url_path_condition = [
            # {
            #   operator         = "Any" # Required
            #   negate_condition = null
            #   match_values     = null
            #   transforms       = null
            # }
          ]
        },
        {
          url_file_extension_condition = [
            # {
            #   operator         = "Any" # Required
            #   negate_condition = null
            #   match_values     = ["html", "htm"] # Required
            #   transforms       = null
            # }
          ]
        },
        {
          url_filename_condition = [
            # {
            #   operator         = "Equal"       # Required
            #   match_values     = ["media.mp4"] # Required if the operator is set to value other than Any
            #   negate_condition = false
            #   transforms       = ["Lowercase", "RemoveNulls", "Trim"]
            # }
          ]
        },
        {
          http_version_condition = [
            # {
            #   match_values     = ["2.0", "1.1"] # Required
            #   operator         = "Equal"
            #   negate_condition = false
            # }
          ]
        },
        {
          cookies_condition = [
            # {
            #   cookie_name      = "cookiename" # Required
            #   operator         = "Equal"      # Required
            #   negate_condition = null
            #   match_values     = null
            #   transforms       = null
            # }
          ]
        },
        {
          is_device_condition = [
            # {
            #   operator         = null
            #   negate_condition = null
            #   match_values     = null
            # }
          ]
        },
        {
          socket_address_condition = [
            # {
            #   operator         = "Any"
            #   negate_condition = null
            #   match_values     = null # Required if operator field is set to IpMatch
            # }
          ]
        },
        {
          client_port_condition = [
            # {
            #   operator         = "Any" # Required
            #   negate_condition = null
            #   match_values     = null
            # }
          ]
        },
        {
          server_port_condition = [
            # {
            #   operator         = "Equal"       # Required
            #   match_values     = ["80", "443"] # Required
            #   negate_condition = null
            # }
          ]
        },
        {
          host_name_condition = [
            # {
            #   operator         = "Equal" # Required
            #   match_values     = ["www.contoso.com", "images.contoso.com", "video.contoso.com"]
            #   transforms       = ["Lowercase", "Trim"]
            #   negate_condition = false
            # }
          ]
        },
        {
          ssl_protocol_condition = [
            # {
            #   match_values     = ["TLSv1.1", "TLSv1.2"] # Required
            #   operator         = "Equal"
            #   negate_condition = false
            # }
          ]
        }
      ]
    }
  }
}
