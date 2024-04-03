variable "azurerm_cdn_frontdoor_origin_params" {
  description = "Object map for Azure Front Door Origin module input parameters."
  type = map(object({
    name                           = string # Required
    cdn_frontdoor_origin_group_id  = string # Required
    host_name                      = string # Required
    certificate_name_check_enabled = bool   # Required
    enabled                        = bool
    http_port                      = number
    https_port                     = number
    origin_host_header             = string
    priority                       = number
    weight                         = number

    private_link = list(object({
      request_message        = string
      target_type            = string
      location               = string # Required
      private_link_target_id = string # Required
    }))
  }))
}
