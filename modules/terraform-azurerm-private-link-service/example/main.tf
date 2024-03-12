module "private_link_service" {
  source  = "app.terraform.io/captionhealth/public-link-service/azurerm"
  version = "1.0.0"

  azurerm_private_link_service_params = {
    main_private_link_service = {
      name                                        = module.name.names["main_private_link_service"].result                                                      # Required
      resource_group_name                         = module.resource_group.resource_groups["main_rg"].name                                                      # Required
      location                                    = module.resource_group.resource_groups["main_rg"].location                                                  # Required
      load_balancer_frontend_ip_configuration_ids = module.load_balancer.load_balancers["main_load_balancer"].frontend_ip_configuration["frontend_ip_config1"] # Required
      auto_approval_subscription_ids              = null
      enable_proxy_protocol                       = null
      fqdns                                       = null
      tags                                        = null
      visibility_subscription_ids                 = null

      nat_ip_configuration = [ # Required
        {
          name                       = "primary"                                                      # Required
          subnet_id                  = module.virtual_network.virtual_networks["main_vnet"].subnet[0] # Required
          primary                    = true                                                           # Required
          private_ip_address         = null
          private_ip_address_version = null
        },
        {
          name                       = "secondary"                                                    # Required
          subnet_id                  = module.virtual_network.virtual_networks["main_vnet"].subnet[1] # Required
          primary                    = false                                                          # Required
          private_ip_address         = null
          private_ip_address_version = null
        }
      ]
    }
  }
}
