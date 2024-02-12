variable "azurerm_private_dns_mx_record_params" {
  description = "Object map for Azure Private DNS MX Record module input parameters."

  type = map(object({
    name                = string
    resource_group_name = string # Required
    zone_name           = string # Required
    ttl                 = number # Required
    tags                = map(string)
    record = map(object({        # Required
      preference = number
      exchange   = string
    }))
  }))
}
