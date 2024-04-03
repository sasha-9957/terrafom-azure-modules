resource "azurerm_subnet" "this" {
  for_each = var.azurerm_subnet_params

  name                                          = each.value.name                 # Required
  resource_group_name                           = each.value.resource_group_name  # Required
  virtual_network_name                          = each.value.virtual_network_name # Required
  address_prefixes                              = each.value.address_prefixes     # Required
  private_endpoint_network_policies_enabled     = each.value.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  service_endpoints                             = each.value.service_endpoints
  service_endpoint_policy_ids                   = each.value.service_endpoint_policy_ids

  dynamic "delegation" {
    iterator = d
    for_each = each.value.delegation

    content {
      name = d.value.name # Required

      dynamic "service_delegation" { # Required
        iterator = sd
        for_each = d.value.service_delegation

        content {
          name    = sd.value.name # Required
          actions = sd.value.actions
        }
      }
    }
  }
}
