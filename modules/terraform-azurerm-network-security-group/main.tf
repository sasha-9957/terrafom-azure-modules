resource "azurerm_network_security_group" "this" {
  for_each = var.azurerm_network_security_group_params

  name                = each.value.name                # Required
  resource_group_name = each.value.resource_group_name # Required
  location            = each.value.location            # Required
  tags                = each.value.tags

  dynamic "security_rule" {
    iterator = sr
    for_each = each.value.security_rule

    content {
      name                                       = sr.value.name # Required
      description                                = sr.value.description
      protocol                                   = sr.value.protocol                # Required
      source_port_range                          = sr.value.source_port_range       # Required if source_port_ranges is not specified.
      source_port_ranges                         = sr.value.source_port_ranges      # Required if source_port_range is not specified.
      destination_port_range                     = sr.value.destination_port_range  # Required if destination_port_ranges is not specified.
      destination_port_ranges                    = sr.value.destination_port_ranges # Required if destination_port_range is not specified.
      source_address_prefix                      = sr.value.source_address_prefix   # Required if source_address_prefixes is not specified.
      source_address_prefixes                    = sr.value.source_address_prefixes # Required if source_address_prefix is not specified.
      source_application_security_group_ids      = sr.value.source_application_security_group_ids
      destination_address_prefix                 = sr.value.destination_address_prefix   # Required if destination_address_prefixes is not specified.
      destination_address_prefixes               = sr.value.destination_address_prefixes # Required if destination_address_prefix is not specified.
      destination_application_security_group_ids = sr.value.destination_application_security_group_ids
      access                                     = sr.value.access    # Required
      priority                                   = sr.value.priority  # Required
      direction                                  = sr.value.direction # Required
    }
  }
}
