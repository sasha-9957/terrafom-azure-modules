variable "azurerm_private_dns_zone_virtual_network_link_params" {
  description = "Object map for Azure Private DNS Zone Virtual Network Link module input parameters."
  type = map(object({
    name                  = string # Required
    private_dns_zone_name = string # Required
    resource_group_name   = string # Required
    virtual_network_id    = string # Required
    registration_enabled  = bool
    tags                  = map(string)
  }))
}
