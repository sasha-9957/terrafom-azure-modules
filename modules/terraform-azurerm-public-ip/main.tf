resource "azurerm_public_ip" "this" {
  for_each = var.azurerm_public_ip_params

  name                    = each.value.name                # Required
  resource_group_name     = each.value.resource_group_name # Required
  location                = each.value.location            # Required
  allocation_method       = each.value.allocation_method   # Required
  zones                   = each.value.zones
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  domain_name_label       = each.value.domain_name_label
  edge_zone               = each.value.edge_zone
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  ip_tags                 = each.value.ip_tags
  ip_version              = each.value.ip_version
  public_ip_prefix_id     = each.value.public_ip_prefix_id
  reverse_fqdn            = each.value.reverse_fqdn
  sku                     = each.value.sku
  sku_tier                = each.value.sku_tier
  tags                    = each.value.tags

  # If this resource is to be associated with a resource that requires disassociation before destruction (such as azurerm_network_interface) it is recommended to set the lifecycle argument create_before_destroy = true.
  lifecycle {
    create_before_destroy = true
  }
}
