variable "azurerm_subnet_params" {
  description = "Object map for Azure Subnet module input parameters."
  type = map(object({
    name                                          = string       # Required
    resource_group_name                           = string       # Required
    virtual_network_name                          = string       # Required
    address_prefixes                              = list(string) # Required
    private_endpoint_network_policies_enabled     = bool
    private_link_service_network_policies_enabled = bool
    service_endpoints                             = set(string)
    service_endpoint_policy_ids                   = set(string)

    delegation = list(object({
      name = string

      service_delegation = list(object({ # Required
        name    = string                 # Required
        actions = list(string)
      }))
    }))
  }))
}
