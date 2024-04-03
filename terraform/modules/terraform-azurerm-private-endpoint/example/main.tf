module "private_endpoint" {
  source  = "app.terraform.io/captionhealth/public-endpoint/azurerm"
  version = "1.0.0"

  azurerm_private_endpoint_params = {
    main_private_endpoint = {
      name                          = module.name.names["main_private_endpoint"].result                         # Required
      resource_group_name           = module.resource_group.resource_groups["main_rg"].name                     # Required
      location                      = module.resource_group.resource_groups["main_rg"].location                 # Required
      subnet_id                     = module.virtual_network.virtual_networks["main_vnet"].subnet["subnet1"].id # Required
      custom_network_interface_name = null
      tags                          = module.tags.tags

      private_dns_zone_group = [
        {
          name                 = "main-dns-zone-group"                                                   # Required
          private_dns_zone_ids = [module.private_dns_zone.private_dns_zones["main_private_dns_zone"].id] # Required
        }
      ]

      private_service_connection = [ # Required
        {
          name                              = module.name.names["main_service_connection"].result # Required
          is_manual_connection              = false                                               # Required
          private_connection_resource_id    = module.private_link_service.private_link_services["main_private_link_service"].id
          private_connection_resource_alias = null
          subresource_names                 = null
          request_message                   = null
        }
      ]

      ip_configuration = [
        {
          name               = "ipconfig1"    # Required
          private_ip_address = "192.168.24.5" # Required
          subresource_name   = null
          member_name        = null
        }
      ]
    }
  }
}
