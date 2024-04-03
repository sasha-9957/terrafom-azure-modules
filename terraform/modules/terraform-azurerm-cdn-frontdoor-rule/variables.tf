variable "azurerm_cdn_frontdoor_rule_params" {
  description = "Object map for Azure Front Door Rule module input parameters."
  type = map(object({
    name                      = string # Required
    cdn_frontdoor_rule_set_id = string # Required
    order                     = number # Required
    behavior_on_match         = string

    actions = list(object({ # Required
      url_rewrite_action = list(object({
        source_pattern          = string # Required
        destination             = string # Required
        preserve_unmatched_path = bool
      }))
      url_redirect_action = list(object({
        redirect_type        = string # Required
        destination_hostname = string # Required
        redirect_protocol    = string
        destination_path     = string
        query_string         = string
        destination_fragment = string
      }))
      route_configuration_override_action = list(object({
        cache_duration                = string
        cdn_frontdoor_origin_group_id = string
        forwarding_protocol           = string
        query_string_caching_behavior = string
        query_string_parameters       = list(string) # Required query_string_caching_behavior is set to IncludeSpecifiedQueryStrings or IgnoreSpecifiedQueryStrings
        compression_enabled           = bool
        cache_behavior                = string
      }))
      request_header_action = list(object({
        header_action = string # Required
        header_name   = string # Required
        value         = string # Required if the header_action is set to Append or Overwrite
      }))
      response_header_action = list(object({
        header_action = string # Required
        header_name   = string # Required
        value         = string # Requiredis required if the header_action is set to Append or Overwrite
      }))
    }))

    conditions = list(object({
      remote_address_condition = list(object({
        operator         = string
        negate_condition = bool
        match_values     = list(string)
      }))
      request_method_condition = list(object({
        match_values     = set(string) # Required
        operator         = string
        negate_condition = bool
      }))
      query_string_condition = list(object({
        operator         = string # Required
        negate_condition = bool
        match_values     = set(string)
        transforms       = list(string)
      }))
      post_args_condition = list(object({
        post_args_name   = string # Required
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
        transforms       = set(string)
      }))
      request_uri_condition = list(object({
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
        transforms       = set(string)
      }))
      request_header_condition = list(object({
        header_name      = string # Required
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
        transforms       = set(string)
      }))
      request_body_condition = list(object({
        operator         = string       # Required
        match_values     = list(string) # Required
        negate_condition = bool
        transforms       = set(string)
      }))
      request_scheme_condition = list(object({
        operator         = string
        negate_condition = bool
        match_values     = list(string)
      }))
      url_path_condition = list(object({
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
        transforms       = set(string)
      }))
      url_file_extension_condition = list(object({
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string) # Required
        transforms       = set(string)
      }))
      url_filename_condition = list(object({
        operator         = string       # Required
        match_values     = list(string) # Required if the operator is set to value other than Any
        negate_condition = bool
        transforms       = set(string)
      }))
      http_version_condition = list(object({
        match_values     = set(string) # Required
        operator         = string
        negate_condition = bool
      }))
      cookies_condition = list(object({
        cookie_name      = string # Required
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
        transforms       = set(string)
      }))
      is_device_condition = list(object({
        operator         = string
        negate_condition = bool
        match_values     = list(string)
      }))
      socket_address_condition = list(object({
        operator         = string
        negate_condition = bool
        match_values     = list(string) # Required if operator field is set to IpMatch
      }))
      client_port_condition = list(object({
        operator         = string # Required
        negate_condition = bool
        match_values     = list(string)
      }))
      server_port_condition = list(object({
        operator         = string      # Required
        match_values     = set(string) # Required
        negate_condition = bool
      }))
      host_name_condition = list(object({
        operator         = string # Required
        match_values     = list(string)
        transforms       = set(string)
        negate_condition = bool
      }))
      ssl_protocol_condition = list(object({
        match_values     = set(string) # Required
        operator         = string
        negate_condition = bool
      }))
    }))
  }))
}
