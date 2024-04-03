variable "azurerm_virtual_network_params" {
  description = "Object map for Azure Virtual Network module input parameters."
  type = map(object({
    name                = string       # required
    resource_group_name = string       # required
    address_space       = list(string) # required
    location            = string       # required
    bgp_community       = string
    ddos_protection_plan = list(object({
      id     = string
      enable = bool
    }))
    encryption = list(object({
      enforcement = bool # required
    }))
    dns_servers             = list(string)
    edge_zone               = string
    flow_timeout_in_minutes = number
    subnet = list(object({
      name           = string # required
      address_prefix = string # required
      security_group = string
    }))
    tags = map(string)
  }))
}
