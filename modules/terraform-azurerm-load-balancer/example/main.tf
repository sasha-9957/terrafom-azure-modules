module "load_balancer" {
  source  = "app.terraform.io/captionhealth/terraform-azurerm-load-balancer/azurerm"
  version = "1.0.0"

  azurerm_lb_params = {
    main_azurerm_lb = {
      name                = module.name.names["main_azurerm_lb"].result               # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name     # Required
      location            = module.resource_group.resource_groups["main_rg"].location # Required
      edge_zone           = null
      sku                 = null
      sku_tier            = null
      tags                = module.tags.tags
      frontend_ip_configuration = [
        # {
        #   name                                               = "frontend_name" # Required
        #   zones                                              = null
        #   subnet_id                                          = null
        #   gateway_load_balancer_frontend_ip_configuration_id = null
        #   private_ip_address                                 = null
        #   private_ip_address_allocation                      = null
        #   private_ip_address_version                         = null
        #   public_ip_address_id                               = module.public_ip.public_ips["main_public_ip"].id
        #   public_ip_prefix_id                                = null
        # }
      ]
    }
  }
}
