resource "azurerm_cdn_frontdoor_rule" "this" {
  for_each = var.azurerm_cdn_frontdoor_rule_params

  name                      = each.value.name                      # Required
  cdn_frontdoor_rule_set_id = each.value.cdn_frontdoor_rule_set_id # Required
  order                     = each.value.order                     # Required
  behavior_on_match         = each.value.behavior_on_match


  dynamic "actions" { # Required
    iterator = a
    for_each = each.value.actions

    content {
      dynamic "url_rewrite_action" {
        iterator = urwa
        for_each = a.value.url_rewrite_action

        content {
          source_pattern          = urwa.value.source_pattern # Required
          destination             = urwa.value.destination    # Required
          preserve_unmatched_path = urwa.value.preserve_unmatched_path
        }
      }
      dynamic "url_redirect_action" {
        iterator = urda
        for_each = a.value.url_redirect_action

        content {
          redirect_type        = urda.value.redirect_type        # Required
          destination_hostname = urda.value.destination_hostname # Required
          redirect_protocol    = urda.value.redirect_protocol
          destination_path     = urda.value.destination_path
          query_string         = urda.value.query_string
          destination_fragment = urda.value.destination_fragment
        }
      }
      dynamic "route_configuration_override_action" {
        iterator = rcoa
        for_each = a.value.route_configuration_override_action

        content {
          cache_duration                = rcoa.value.cache_duration
          cdn_frontdoor_origin_group_id = rcoa.value.cdn_frontdoor_origin_group_id
          forwarding_protocol           = rcoa.value.forwarding_protocol
          query_string_caching_behavior = rcoa.value.query_string_caching_behavior
          query_string_parameters       = rcoa.value.query_string_parameters # Required query_string_caching_behavior is set to IncludeSpecifiedQueryStrings or IgnoreSpecifiedQueryStrings
          compression_enabled           = rcoa.value.compression_enabled
          cache_behavior                = rcoa.value.cache_behavior
        }
      }
      dynamic "request_header_action" {
        iterator = rqha
        for_each = a.value.request_header_action

        content {
          header_action = rqha.value.header_action # Required
          header_name   = rqha.value.header_name   # Required
          value         = rqha.value.value         # Required if the header_action is set to Append or Overwrite
        }
      }
      dynamic "response_header_action" {
        iterator = rsha
        for_each = a.value.response_header_action

        content {
          header_action = rsha.value.header_action # Required
          header_name   = rsha.value.header_name   # Required
          value         = rsha.value.value         # Requiredis required if the header_action is set to Append or Overwrite
        }
      }
    }
  }

  dynamic "conditions" {
    iterator = c
    for_each = each.value.conditions

    content {
      dynamic "remote_address_condition" {
        iterator = remac
        for_each = c.value.remote_address_condition

        content {
          operator         = remac.value.operator
          negate_condition = remac.value.negate_condition
          match_values     = remac.value.match_values
        }
      }
      dynamic "request_method_condition" {
        iterator = reqmc
        for_each = c.value.request_method_condition

        content {
          match_values     = reqmc.value.match_values # Required
          operator         = reqmc.value.operator
          negate_condition = reqmc.value.negate_condition
        }
      }
      dynamic "query_string_condition" {
        iterator = qsc
        for_each = c.value.query_string_condition

        content {
          operator         = qsc.value.operator # Required
          negate_condition = qsc.value.negate_condition
          match_values     = qsc.value.match_values
          transforms       = qsc.value.transforms
        }
      }
      dynamic "post_args_condition" {
        iterator = pac
        for_each = c.value.post_args_condition

        content {
          post_args_name   = pac.value.post_args_name # Required
          operator         = pac.value.operator       # Required
          negate_condition = pac.value.negate_condition
          match_values     = pac.value.match_values
          transforms       = pac.value.transforms
        }
      }
      dynamic "request_uri_condition" {
        iterator = requc
        for_each = c.value.request_uri_condition

        content {
          operator         = requc.value.operator # Required
          negate_condition = requc.value.negate_condition
          match_values     = requc.value.match_values
          transforms       = requc.value.transforms
        }
      }
      dynamic "request_header_condition" {
        iterator = reqhc
        for_each = c.value.request_header_condition

        content {
          header_name      = reqhc.value.header_name # Required
          operator         = reqhc.value.operator    # Required
          negate_condition = reqhc.value.negate_condition
          match_values     = reqhc.value.match_values
          transforms       = reqhc.value.transforms
        }
      }
      dynamic "request_body_condition" {
        iterator = rbc
        for_each = c.value.request_body_condition

        content {
          operator         = rbc.value.operator     # Required
          match_values     = rbc.value.match_values # Required
          negate_condition = rbc.value.negate_condition
          transforms       = rbc.value.transforms
        }
      }
      dynamic "request_scheme_condition" {
        iterator = rsc
        for_each = c.value.request_scheme_condition

        content {
          operator         = rsc.value.operator
          negate_condition = rsc.value.negate_condition
          match_values     = rsc.value.match_values
        }
      }
      dynamic "url_path_condition" {
        iterator = upc
        for_each = c.value.url_path_condition

        content {
          operator         = upc.value.operator # Required
          negate_condition = upc.value.negate_condition
          match_values     = upc.value.match_values
          transforms       = upc.value.transforms
        }
      }
      dynamic "url_file_extension_condition" {
        iterator = ufec
        for_each = c.value.url_file_extension_condition

        content {
          operator         = ufec.value.operator # Required
          negate_condition = ufec.value.negate_condition
          match_values     = ufec.value.match_values # Required
          transforms       = ufec.value.transforms
        }
      }
      dynamic "url_filename_condition" {
        iterator = ufc
        for_each = c.value.url_filename_condition

        content {
          operator         = ufc.value.operator     # Required
          match_values     = ufc.value.match_values # Required if the operator is set to value other than Any
          negate_condition = ufc.value.negate_condition
          transforms       = ufc.value.transforms
        }
      }
      dynamic "http_version_condition" {
        iterator = hvc
        for_each = c.value.http_version_condition

        content {
          match_values     = hvc.value.match_values # Required
          operator         = hvc.value.operator
          negate_condition = hvc.value.negate_condition
        }
      }
      dynamic "cookies_condition" {
        iterator = cc
        for_each = c.value.cookies_condition

        content {
          cookie_name      = cc.value.cookie_name # Required
          operator         = cc.value.operator    # Required
          negate_condition = cc.value.negate_condition
          match_values     = cc.value.match_values
          transforms       = cc.value.transforms
        }
      }
      dynamic "is_device_condition" {
        iterator = idc
        for_each = c.value.is_device_condition

        content {
          operator         = idc.value.operator
          negate_condition = idc.value.negate_condition
          match_values     = idc.value.match_values
        }
      }
      dynamic "socket_address_condition" {
        iterator = sac
        for_each = c.value.socket_address_condition

        content {
          operator         = sac.value.operator
          negate_condition = sac.value.negate_condition
          match_values     = sac.value.match_values # Required if operator field is set to IpMatch
        }
      }
      dynamic "client_port_condition" {
        iterator = cpc
        for_each = c.value.client_port_condition

        content {
          operator         = cpc.value.operator # Required
          negate_condition = cpc.value.negate_condition
          match_values     = cpc.value.match_values
        }
      }
      dynamic "server_port_condition" {
        iterator = srvpc
        for_each = c.value.server_port_condition

        content {
          operator         = srvpc.value.operator     # Required
          match_values     = srvpc.value.match_values # Required
          negate_condition = srvpc.value.negate_condition
        }
      }
      dynamic "host_name_condition" {
        iterator = hnc
        for_each = c.value.host_name_condition

        content {
          operator         = hnc.value.operator # Required
          match_values     = hnc.value.match_values
          transforms       = hnc.value.transforms
          negate_condition = hnc.value.negate_condition
        }
      }
      dynamic "ssl_protocol_condition" {
        iterator = sslpc
        for_each = c.value.ssl_protocol_condition

        content {
          match_values     = sslpc.value.match_values # Required
          operator         = sslpc.value.operator
          negate_condition = sslpc.value.negate_condition
        }
      }
    }
  }
}
