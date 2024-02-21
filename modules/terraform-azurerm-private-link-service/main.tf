resource "azurerm_private_link_service" "this" {
  for_each = var.azurerm_private_link_service_params

  name                                        = each.value.name                                        # Required
  resource_group_name                         = each.value.resource_group_name                         # Required
  location                                    = each.value.location                                    # Required
  load_balancer_frontend_ip_configuration_ids = each.value.load_balancer_frontend_ip_configuration_ids # Required
  auto_approval_subscription_ids              = each.value.auto_approval_subscription_ids
  enable_proxy_protocol                       = each.value.enable_proxy_protocol
  fqdns                                       = each.value.fqdns
  tags                                        = each.value.tags
  visibility_subscription_ids                 = each.value.visibility_subscription_ids

  dynamic "nat_ip_configuration" { # Required
    iterator = nip
    for_each = each.value.nat_ip_configuration

    content {
      name                       = nip.value.name      # Required
      subnet_id                  = nip.value.subnet_id # Required
      primary                    = nip.value.primary   # Required
      private_ip_address         = nip.value.private_ip_address
      private_ip_address_version = nip.value.private_ip_address_version
    }
  }
}
