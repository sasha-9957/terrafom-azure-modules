variable "azurerm_cdn_frontdoor_rule_set_params" {
  description = "Object map for Azure Front Door Rule Set module input parameters."
  type = map(object({
    name                     = string # Required
    cdn_frontdoor_profile_id = string # Required
  }))
}
