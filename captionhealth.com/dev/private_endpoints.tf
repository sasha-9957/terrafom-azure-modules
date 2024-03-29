module "private_endpoint" {
  source = "../../modules/terraform-azurerm-private-endpoint"

  azurerm_private_endpoint_params = {
    main_private_endpoint = {
      name                          = module.name.names["main_private_endpoint"].result         # Required
      resource_group_name           = module.resource_group.resource_groups["main_rg"].name     # Required
      location                      = module.resource_group.resource_groups["main_rg"].location # Required
      subnet_id                     = module.subnet.subnets["subnet1"].id                       # Required
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
          private_connection_resource_id    = module.storage_account.storage_accounts["main_storage_account"].id
          private_connection_resource_alias = null
          subresource_names                 = ["blob"]
          request_message                   = null
        }
      ]

      ip_configuration = [
        # {
        #   name               = "ipconfig1"                 # Required
        #   private_ip_address = ic.value.private_ip_address # Required
        #   subresource_name   = null
        #   member_name        = null
        # }
      ]
    }
  }
}
