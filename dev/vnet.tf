module "virtual_network" {
  source = "../modules/terraform-azurerm-virtual-network"

  azurerm_virtual_network_params = {
    vnet1 = {
      name                    = module.name.names["main_vnet"].result                     # required
      resource_group_name     = module.resource_group.resource_groups["main_rg"].name     # required
      address_space           = ["10.53.0.0/16"]                                          # required
      location                = module.resource_group.resource_groups["main_rg"].location # required
      bgp_community           = null
      ddos_protection_plan    = []
      encryption              = []
      dns_servers             = []
      edge_zone               = null
      flow_timeout_in_minutes = null
      subnet                  = []
      tags                    = module.tags.tags
    }
  }
}

module "subnet" {
  source = "../modules/terraform-azurerm-subnet"

  azurerm_subnet_params = {
    linux_subnet = {
      name                                          = module.name.names["linux_subnet"].result
      resource_group_name                           = module.resource_group.resource_groups["main_rg"].name
      virtual_network_name                          = module.virtual_network.virtual_networks["vnet1"].name
      address_prefixes                              = ["10.53.132.112/28"]
      private_endpoint_network_policies_enabled     = null
      private_link_service_network_policies_enabled = null
      service_endpoints                             = ["Microsoft.Storage"]
      service_endpoint_policy_ids                   = null

      delegation = [
        {
          name = "delegation"

          service_delegation = [
            {
              name    = "Microsoft.Web/serverFarms"
              actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          ]
        }
      ]
    }
  }
}
