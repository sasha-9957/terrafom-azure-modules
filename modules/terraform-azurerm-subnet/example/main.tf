module "subnet" {
  source  = "app.terraform.io/captionhealth/subnet/azurerm"
  version = "1.0.0"

  azurerm_subnet_params = {
    subnet1 = {
      name                                          = module.name.names["subnet1"].result                                  # Required
      resource_group_name                           = module.storage_account.storage_accounts["main_storage_account"].name # Required
      virtual_network_name                          = module.virtual_network.virtual_networks["main_vnet"]                 # Required
      address_prefixes                              = ["10.0.1.0/24"]                                                      # Required
      private_endpoint_network_policies_enabled     = null
      private_link_service_network_policies_enabled = null
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
      name                                          = module.name.names["subnet2"].result                                  # Required
      resource_group_name                           = module.storage_account.storage_accounts["main_storage_account"].name # Required
      virtual_network_name                          = module.virtual_network.virtual_networks["main_vnet"]                 # Required
      address_prefixes                              = ["10.0.2.0/24"]                                                      # Required
      private_endpoint_network_policies_enabled     = null
      private_link_service_network_policies_enabled = null
      service_endpoints                             = null
      service_endpoint_policy_ids                   = null

      delegation = [
        # {
        #   name = "delegation2" # Required

        #   service_delegation = [ # Required
        #     {
        #       name    = "Microsoft.ApiManagement/service" # Required
        #       actions = null
        #     }
        #   ]
        # }
      ]
    }
  }
}
