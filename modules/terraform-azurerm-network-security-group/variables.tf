variable "azurerm_network_security_group_params" {
  description = "Object map for Azure Network Security Group module input parameters."

  type = map(object({
    name                = string # Required
    resource_group_name = string # Required
    location            = string # Required
    tags                = map(string)

    security_rule = list(object({
      name                                       = string # Required
      description                                = string
      protocol                                   = string       # Required
      source_port_range                          = string       # Required if source_port_ranges is not specified.
      source_port_ranges                         = list(string) # Required if source_port_range is not specified.
      destination_port_range                     = string       # Required if destination_port_ranges is not specified.
      destination_port_ranges                    = list(string) # Required if destination_port_range is not specified.
      source_address_prefix                      = string       # Required if source_address_prefixes is not specified.
      source_address_prefixes                    = list(string) # Required if source_address_prefix is not specified.
      source_application_security_group_ids      = list(string)
      destination_address_prefix                 = string       # Required if destination_address_prefixes is not specified.
      destination_address_prefixes               = list(string) # Required if destination_address_prefix is not specified.
      destination_application_security_group_ids = list(string)
      access                                     = string # Required
      priority                                   = number # Required
      direction                                  = string
    }))
  }))
}
