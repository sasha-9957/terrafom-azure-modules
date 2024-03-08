module "azurerm_network_security_group" {
  source  = "app.terraform.io/captionhealth/terraform-azurerm-network-security-group/azurerm"
  version = "1.0.0"

  azurerm_network_security_group_params = {
    main_azurerm_network_security_group = {
      name                = module.name.names["main_azurerm_network_security_group"].result # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name           # Required
      location            = module.resource_group.resource_groups["main_rg"].location       # Required
      tags                = module.tags.tags

      security_rule = [
        {
          name                                       = module.name.names["main_security_rule"].result # Required
          description                                = "Access to MSSQL"
          protocol                                   = "Tcp"                           # Required
          source_port_range                          = "*"                             # Required if source_port_ranges is not specified.
          source_port_ranges                         = null                            # Required if source_port_range is not specified.
          destination_port_range                     = "1433"                          # Required if destination_port_ranges is not specified.
          destination_port_ranges                    = null                            # Required if destination_port_range is not specified.
          source_address_prefix                      = null                            # Required if source_address_prefixes is not specified.
          source_address_prefixes                    = ["172.31.1.1", "172.31.2.0/24"] # Required if source_address_prefix is not specified.
          source_application_security_group_ids      = null
          destination_address_prefix                 = "172.31.2.10" # Required if destination_address_prefixes is not specified.
          destination_address_prefixes               = null          # Required if destination_address_prefix is not specified.
          destination_application_security_group_ids = null
          access                                     = "Allow"   # Required
          priority                                   = 100       # Required
          direction                                  = "Inbound" # Required
        }
      ]
    }
  }
}
