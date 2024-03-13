module "network_interface" {
  source  = "app.terraform.io/captionhealth/network-interface/azurerm"
  version = "1.0.0"

  azurerm_network_interface_params = {
    network_interface1 = {
      location            = module.resource_group.resource_groups["main_rg"].location # Required
      name                = module.name.names["network_interface1"].result            # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name     # Required
      # auxiliary_mode is in Preview and requires that the preview is enabled
      auxiliary_mode = null
      # auxiliary_sku is in Preview and requires that the preview is enabled
      auxiliary_sku                 = null
      dns_servers                   = each.value.dns_servers
      edge_zone                     = each.value.edge_zone
      enable_ip_forwarding          = each.value.enable_ip_forwarding
      enable_accelerated_networking = each.value.enable_accelerated_networking
      internal_dns_name_label       = each.value.internal_dns_name_label
      tags                          = module.tags.tags

      ip_configuration = [
        # {
        #   name                                               = "ip_config1" # Required
        #   gateway_load_balancer_frontend_ip_configuration_id = ic.value.gateway_load_balancer_frontend_ip_configuration_id
        #   subnet_id                                          = module.subnet.subnets["subnet1"].id
        #   private_ip_address_version                         = "IPv4"
        #   private_ip_address_allocation                      = "Static" # Required
        #   public_ip_address_id                               = module.public_ip.public_ips["public_ip1"].id
        #   primary                                            = true
        #   private_ip_address                                 = "10.0.1.56"
        # }
      ]
    }
  }
}
