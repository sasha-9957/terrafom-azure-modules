variable "azurerm_private_dns_cname_record_params" {
  description = "Object map for Azure Private DNS CNAME Record module input parameters."

  type = map(object({
    name                = string # Required
    resource_group_name = string # Required
    zone_name           = string # Required
    ttl                 = number # Required
    record              = string # Required
    tags                = map(string)
  }))
}
