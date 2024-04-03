module "virtual_network" {
  source = "../../modules/terraform-azurerm-virtual-network"

  azurerm_virtual_network_params = {
    main_vnet = {
      name                = module.name.names["main_vnet"].result                     # required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name     # required
      address_space       = ["10.0.0.0/16"]                                           # required
      location            = module.resource_group.resource_groups["main_rg"].location # required
      bgp_community       = null
      ddos_protection_plan = [
        # {
        #   id     = null
        #   enable = null
        # }
      ]

      encryption = [
        # {
        #   enforcement = null # required
        # }
      ]
      dns_servers             = []
      edge_zone               = null
      flow_timeout_in_minutes = null
      subnet                  = []

      tags = module.tags.tags
    }
    dwh_vnet = {
      name                = module.name.names["dwh_vnet"].result                     # required
      resource_group_name = module.resource_group.resource_groups["dwh_rg"].name     # required
      address_space       = ["10.53.0.0/16"]                                           # required
      location            = module.resource_group.resource_groups["dwh_rg"].location # required
      bgp_community       = null
      ddos_protection_plan = [
        # {
        #   id     = null
        #   enable = null
        # }
      ]

      encryption = [
        # {
        #   enforcement = null # required
        # }
      ]
      dns_servers             = []
      edge_zone               = null
      flow_timeout_in_minutes = null
      subnet                  = []

      tags = module.tags.tags
    }
  }
}
