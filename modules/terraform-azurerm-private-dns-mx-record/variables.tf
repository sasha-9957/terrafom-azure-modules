variable "azurerm_private_dns_mx_record_params" {
  description = "Object map for Azure Private DNS MX Record module input parameters."

  type = map(object({
    name                = string 
    resource_group_name = string       # required
    zone_name           = string       # required
    ttl                 = number       # required
    tags                = map(string)
    record = map(object({
      preference = number
      exchange   = string
    }))
  }))
}
