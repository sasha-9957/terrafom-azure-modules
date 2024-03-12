variable "azurerm_cdn_frontdoor_endpoint_params" {
  description = "Object map for Azure Front Door Endpoint module input parameters."
  type = map(object({
    name                     = string # Required
    cdn_frontdoor_profile_id = string # Required
    enabled                  = bool
    tags                     = map(string)
  }))
}
