variable "azurerm_private_link_service_params" {
  description = "Object map for Azure Private Link Service module input parameters."
  type = map(object({
    name                                        = string      # Required
    resource_group_name                         = string      # Required
    location                                    = string      # Required
    load_balancer_frontend_ip_configuration_ids = set(string) # Required
    auto_approval_subscription_ids              = set(string)
    enable_proxy_protocol                       = bool
    fqdns                                       = list(string)
    tags                                        = map(string)
    visibility_subscription_ids                 = set(string)

    nat_ip_configuration = list(object({
      name                       = string # Required
      subnet_id                  = string # Required
      primary                    = bool   # Required
      private_ip_address         = string
      private_ip_address_version = string
    }))
  }))
}
