variable "azurerm_cdn_frontdoor_custom_domain_association_params" {
  description = "Object map for Azure Front Door Custom Domain Association module input parameters."
  type = map(object({
    cdn_frontdoor_custom_domain_id = string       # Required
    cdn_frontdoor_route_ids        = list(string) # Required
  }))
}
