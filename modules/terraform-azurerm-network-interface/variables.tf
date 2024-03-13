variable "azurerm_network_interface_params" {
  description = "Object map for Azure Network Interface module input parameters."
  type = map(object({
    location            = string # Required
    name                = string # Required
    resource_group_name = string # Required
    # auxiliary_mode is in Preview and requires that the preview is enabled
    auxiliary_mode = string
    # auxiliary_sku is in Preview and requires that the preview is enabled
    auxiliary_sku                 = string
    dns_servers                   = list(string)
    edge_zone                     = string
    enable_ip_forwarding          = bool
    enable_accelerated_networking = bool
    internal_dns_name_label       = string
    tags                          = map(string)

    ip_configuration = list(object({
      name                                               = string # Required
      gateway_load_balancer_frontend_ip_configuration_id = string
      subnet_id                                          = string
      private_ip_address_version                         = string
      private_ip_address_allocation                      = string # Required
      public_ip_address_id                               = string
      primary                                            = bool
      private_ip_address                                 = string
    }))
  }))
}
