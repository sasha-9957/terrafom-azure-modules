variable "azurerm_private_dns_cname_record_params" {
  type = map(object({
    name                = string # required
    resource_group_name = string # required
    zone_name           = string # required
    ttl                 = number # required
    record              = string # required
    tags                = map(string)
  }))
}
