variable "azurerm_private_dns_zone_params" {
  description = "Object map for Azure Private DNS Zone module input parameters."
  type = map(object({
    name                = string # required
    resource_group_name = string # required
    tags                = map(string)

    soa_record = list(object({
      email        = string # required
      expire_time  = number
      minimum_ttl  = number
      refresh_time = number
      retry_time   = number
      ttl          = number
      tags         = map(string)
    }))
  }))
}
