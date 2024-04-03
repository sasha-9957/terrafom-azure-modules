variable "azurerm_cdn_frontdoor_custom_domain_params" {
  description = "Object map for Azure Front Door Custom Domain module input parameters."
  type = map(object({
    name                     = string # Required
    cdn_frontdoor_profile_id = string # Required
    host_name                = string # Required
    dns_zone_id              = string

    tls = list(object({ # Required
      certificate_type        = string
      minimum_tls_version     = string
      cdn_frontdoor_secret_id = string
    }))
  }))
}
