variable "azurerm_private_dns_ptr_record_params" {
  description = "Object map for Azure Private PTR Record module input parameters."

  type = map(object({
    name                = string      # Required
    resource_group_name = string      # Required
    zone_name           = string      # Required
    ttl                 = number      # Required
    records             = set(string) # Required
    tags                = map(string)
  }))
}
