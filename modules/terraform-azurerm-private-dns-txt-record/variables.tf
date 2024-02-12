variable "azurerm_private_dns_txt_record_params" {
  description = "Object map for Azure Private DNS TXT Record module input parameters."

  type = map(object({
    name                = string # Required
    resource_group_name = string # Required
    zone_name           = string # Required
    ttl                 = number # Required
    tags                = map(string)
    record = map(object({
      value = string
    }))
  }))
}
