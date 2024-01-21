variable "azurerm_private_dns_a_record_params" {
  type = map(object({
    name                = string      # required
    resource_group_name = string      # required
    zone_name           = string      # required
    ttl                 = number      # required
    records             = set(string) # required
    tags                = map(string)
  }))
}
