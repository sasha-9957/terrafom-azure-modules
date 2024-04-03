module "subnet" {
  source = "../../modules/terraform-azurerm-subnet"

  azurerm_subnet_params = {
    subnet1 = {
      name                                          = module.name.names["subnet1"].result                       # Required
      resource_group_name                           = module.resource_group.resource_groups["main_rg"].name     # Required
      virtual_network_name                          = module.virtual_network.virtual_networks["main_vnet"].name # Required
      address_prefixes                              = ["10.0.1.0/24"]                                           # Required
      private_endpoint_network_policies_enabled     = false
      private_link_service_network_policies_enabled = false
      service_endpoints                             = null
      service_endpoint_policy_ids                   = null

      delegation = [
        # {
        #   name = "delegation1" # Required

        #   service_delegation = [ # Required
        #     {
        #       name    = "Microsoft.ApiManagement/service" # Required
        #       actions = null
        #     }
        #   ]
        # }
      ]
    }
    subnet2 = {
      name                                          = module.name.names["subnet2"].result                       # Required
      resource_group_name                           = module.resource_group.resource_groups["main_rg"].name     # Required
      virtual_network_name                          = module.virtual_network.virtual_networks["main_vnet"].name # Required
      address_prefixes                              = ["10.0.2.0/24"]                                           # Required
      private_endpoint_network_policies_enabled     = false
      private_link_service_network_policies_enabled = false
      service_endpoints                             = null
      service_endpoint_policy_ids                   = null

      delegation = [
        # {
        #   name = "delegation1" # Required

        #   service_delegation = [ # Required
        #     {
        #       name    = "Microsoft.ApiManagement/service" # Required
        #       actions = null
        #     }
        #   ]
        # }
      ]
    }
    dwh_linux_subnet = {
      name                                          = module.name.names["dwh_linux_subnet"].result
      resource_group_name                           = module.resource_group.resource_groups["dwh_rg"].name
      virtual_network_name                          = module.virtual_network.virtual_networks["dwh_vnet"].name
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
