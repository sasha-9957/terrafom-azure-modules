variable "azurerm_private_endpoint_params" {
  description = "Object map for Azure Private Endpoint module input parameters."
  type = map(object({

    name                          = string # Required
    resource_group_name           = string # Required
    location                      = string # Required
    subnet_id                     = string # Required
    custom_network_interface_name = string
    tags                          = map(string)

    private_dns_zone_group = list(object({
      name                 = string       # Required
      private_dns_zone_ids = list(string) # Required
    }))

    private_service_connection = list(object({
      name                              = string # Required
      is_manual_connection              = bool   # Required
      private_connection_resource_id    = string
      private_connection_resource_alias = string
      subresource_names                 = list(string)
      request_message                   = string
    }))

    ip_configuration = list(object({
      name               = string # Required
      private_ip_address = string # Required
      subresource_name   = string
      member_name        = string
    }))
  }))
}
