module "private_dns_zone_virtual_network_link" {
  source  = "app.terraform.io/captionhealth/private-dns-zone-virtual-network-link/azurerm"
  version = "1.0.0"

  azurerm_private_dns_zone_virtual_network_link_params = {
    main_private_dns_zone_virtual_network_link = {
      name                  = module.name.names["main_private_dns_zone_virtual_network_link"].result  # required
      private_dns_zone_name = module.private_dns_zone.private_dns_zones["main_private_dns_zone"].name # Required
      resource_group_name   = module.resource_group.resource_groups["main_rg"].name                   # Required
      virtual_network_id    = module.virtual_network.virtual_networks["main_virtual_network"].id      # Required
      registration_enabled  = true
      tags                  = module.tags.tags
    }
  }
}
