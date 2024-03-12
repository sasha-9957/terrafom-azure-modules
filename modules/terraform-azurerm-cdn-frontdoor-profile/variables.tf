variable "azurerm_cdn_frontdoor_profile_params" {
  description = "Object map for Azure Front Door Profile module input parameters."
  type = map(object({
    name                     = string # Required
    resource_group_name      = string # Required
    sku_name                 = string # Required
    response_timeout_seconds = number
    tags                     = map(string)
  }))
}
