resource "azurerm_lb" "this" {
  for_each = var.azurerm_lb_params

  name                = each.value.name                # Required
  resource_group_name = each.value.resource_group_name # Required
  location            = each.value.location            # Required
  edge_zone           = each.value.edge_zone
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier
  tags                = each.value.tags

  dynamic "frontend_ip_configuration" {
    iterator = fic
    for_each = each.value.frontend_ip_configuration

    content {
      name                                               = fic.value.name # Required
      zones                                              = fic.value.zones
      subnet_id                                          = fic.value.subnet_id
      gateway_load_balancer_frontend_ip_configuration_id = fic.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address                                 = fic.value.private_ip_address
      private_ip_address_allocation                      = fic.value.private_ip_address_allocation
      private_ip_address_version                         = fic.value.private_ip_address_version
      public_ip_address_id                               = fic.value.public_ip_address_id
      public_ip_prefix_id                                = fic.value.public_ip_prefix_id
    }
  }
}
