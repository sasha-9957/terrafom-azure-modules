variable "azurerm_private_dns_mx_record_params" {
  type = map(object({
    name                = string # required
    resource_group_name = string # required
    zone_name           = string # required
    ttl                 = number # required
    tags                = map(string)
    record = map(object({
      preference = number
      exchange   = string
    }))
  }))
}
