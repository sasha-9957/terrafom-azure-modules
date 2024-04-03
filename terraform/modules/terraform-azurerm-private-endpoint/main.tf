resource "azurerm_private_endpoint" "this" {
  for_each = var.azurerm_private_endpoint_params

  name                          = each.value.name                # Required
  resource_group_name           = each.value.resource_group_name # Required
  location                      = each.value.location            # Required
  subnet_id                     = each.value.subnet_id           # Required
  custom_network_interface_name = each.value.custom_network_interface_name
  tags                          = each.value.tags

  dynamic "private_dns_zone_group" {
    iterator = pdzg
    for_each = each.value.private_dns_zone_group

    content {
      name                 = pdzg.value.name                 # Required
      private_dns_zone_ids = pdzg.value.private_dns_zone_ids # Required
    }
  }

  dynamic "private_service_connection" { # Required
    iterator = psc
    for_each = each.value.private_service_connection

    content {
      name                              = psc.value.name                 # Required
      is_manual_connection              = psc.value.is_manual_connection # Required
      private_connection_resource_id    = psc.value.private_connection_resource_id
      private_connection_resource_alias = psc.value.private_connection_resource_alias
      subresource_names                 = psc.value.subresource_names
      request_message                   = psc.value.request_message
    }
  }

  dynamic "ip_configuration" {
    iterator = ic
    for_each = each.value.ip_configuration

    content {
      name               = ic.value.name               # Required
      private_ip_address = ic.value.private_ip_address # Required
      subresource_name   = ic.value.subresource_name
      member_name        = ic.value.member_name
    }
  }
}
