# module "virtual_network" {
#   source = "../modules/terraform-azurerm-virtual-network"

#   azurerm_virtual_network_params = {
#     vnet1 = {
#       name                    = module.name.names["main_vnet"].result                     # required
#       resource_group_name     = module.resource_group.resource_groups["main_rg"].name     # required
#       address_space           = var.address_space                                         # required
#       location                = module.resource_group.resource_groups["main_rg"].location # required
#       bgp_community           = null
#       ddos_protection_plan    = []
#       encryption              = []
#       dns_servers             = []
#       edge_zone               = null
#       flow_timeout_in_minutes = null
#       subnet                  = []
#       tags                    = module.tags.tags
#     }
#   }
# }

# module "subnet" {
#   source = "../modules/terraform-azurerm-subnet"

#   azurerm_subnet_params = {
#     subnet1 = {
#       name                                          = module.name.names["subnet1"].result                   # Required
#       resource_group_name                           = module.resource_group.resource_groups["main_rg"].name # Required
#       virtual_network_name                          = module.virtual_network.virtual_networks["vnet1"].name # Required
#       address_prefixes                              = var.linux_subnet                                      # Required
#       private_endpoint_network_policies_enabled     = null
#       private_link_service_network_policies_enabled = null
#       service_endpoints                             = null
#       service_endpoint_policy_ids                   = null

#       delegation = [
#         {
#           name = "delegation1" # Required

#           service_delegation = [ # Required
#             {
#               name    = "Microsoft.PowerPlatform/vnetaccesslinks"
#               actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#             }
#           ]
#         }
#       ]
#     }
#     subnet2 = {
#       name                                          = module.name.names["subnet2"].result                   # Required
#       resource_group_name                           = module.resource_group.resource_groups["main_rg"].name # Required
#       virtual_network_name                          = module.virtual_network.virtual_networks["vnet1"].name # Required
#       address_prefixes                              = var.powerbi_subnet                                    # Require
#       private_endpoint_network_policies_enabled     = null
#       private_link_service_network_policies_enabled = null
#       service_endpoints                             = null
#       service_endpoint_policy_ids                   = null

#       delegation = [
#         {
#           name = "delegation2" # Required

#           service_delegation = [ # Required
#             {
#               name    = "Microsoft.PowerPlatform/vnetaccesslinks"
#               actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#             }
#           ]
#         }
#       ]
#     }
#   }
# }
