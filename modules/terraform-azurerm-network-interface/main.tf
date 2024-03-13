resource "azurerm_network_interface" "this" {
  for_each = var.azurerm_network_interface_params

  location            = each.value.location            # Required
  name                = each.value.name                # Required
  resource_group_name = each.value.resource_group_name # Required
  # auxiliary_mode is in Preview and requires that the preview is enabled
  auxiliary_mode = each.value.auxiliary_mode
  # auxiliary_sku is in Preview and requires that the preview is enabled
  auxiliary_sku                 = each.value.auxiliary_sku
  dns_servers                   = each.value.dns_servers
  edge_zone                     = each.value.edge_zone
  enable_ip_forwarding          = each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking
  internal_dns_name_label       = each.value.internal_dns_name_label
  tags                          = each.value.tags

  dynamic "ip_configuration" { # Required
    iterator = ic
    for_each = each.value.ip_configuration

    content {
      name                                               = ic.value.name # Required
      gateway_load_balancer_frontend_ip_configuration_id = ic.value.gateway_load_balancer_frontend_ip_configuration_id
      subnet_id                                          = ic.value.subnet_id
      private_ip_address_version                         = ic.value.private_ip_address_version
      private_ip_address_allocation                      = ic.value.private_ip_address_allocation # Required
      public_ip_address_id                               = ic.value.public_ip_address_id
      primary                                            = ic.value.primary
      private_ip_address                                 = ic.value.private_ip_address
    }
  }
}
