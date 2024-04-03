variable "azurerm_lb_params" {
  description = "Object map for Azure Load Balancer module input parameters."

  type = map(object({
    name                = string # Required
    resource_group_name = string # Required
    location            = string # Required
    edge_zone           = string
    sku                 = string
    sku_tier            = string
    tags                = map(string)

    frontend_ip_configuration = list(object({
      name                                               = string # Required
      zones                                              = set(string)
      subnet_id                                          = string
      gateway_load_balancer_frontend_ip_configuration_id = string
      private_ip_address                                 = string
      private_ip_address_allocation                      = string
      private_ip_address_version                         = string
      public_ip_address_id                               = string
      public_ip_prefix_id                                = string
    }))
  }))
}
