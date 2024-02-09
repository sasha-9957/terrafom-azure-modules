variable "azurerm_private_dns_cname_record_params" {
  description = "Object map for Azure Private DNS CNAME Record module input parameters."

  type = map(object({
    name                = string      # required
    resource_group_name = string      # required
    zone_name           = string      # required
    ttl                 = number      # required
    record              = string      # required
    tags                = map(string)
  }))
}
