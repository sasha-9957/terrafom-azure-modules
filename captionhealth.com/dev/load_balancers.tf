module "load_balancer" {
  source = "../../modules/terraform-azurerm-load-balancer"

  azurerm_lb_params = {
    main_load_balancer = {
      name                = module.name.names["main_load_balancer"].result            # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name     # Required
      location            = module.resource_group.resource_groups["main_rg"].location # Required
      edge_zone           = null
      sku                 = "Standard"
      sku_tier            = null
      tags                = module.tags.tags

      frontend_ip_configuration = [
        {
          name                                               = "frontend_ip_config1" # Required
          zones                                              = null
          subnet_id                                          = null
          gateway_load_balancer_frontend_ip_configuration_id = null
          private_ip_address                                 = null
          private_ip_address_allocation                      = null
          private_ip_address_version                         = null
          public_ip_address_id                               = module.public_ip.public_ips["public_ip1"].id
          public_ip_prefix_id                                = null
        }
      ]
    }
  }
}
