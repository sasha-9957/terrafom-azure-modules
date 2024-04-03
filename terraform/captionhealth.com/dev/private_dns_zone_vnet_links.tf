module "private_dns_zone_virtual_network_link" {
  source = "../../modules/terraform-azurerm-private-dns-virtual-network-link"

  azurerm_private_dns_zone_virtual_network_link_params = {
    main_private_dns_zone_virtual_network_link = {
      name                  = format("%s-%s", module.virtual_network.virtual_networks["main_vnet"].name, "link") # required
      private_dns_zone_name = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name            # Required
      resource_group_name   = module.resource_group.resource_groups["main_rg"].name                              # Required
      virtual_network_id    = module.virtual_network.virtual_networks["main_vnet"].id                            # Required
      registration_enabled  = true
      tags                  = module.tags.tags
    }
  }
}
