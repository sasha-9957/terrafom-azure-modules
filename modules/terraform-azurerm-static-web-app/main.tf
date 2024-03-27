resource "azurerm_static_web_app" "this" {
  for_each = var.azurerm_static_web_app_params

  name                               = each.value.name                # Required
  location                           = each.value.location            # Required
  resource_group_name                = each.value.resource_group_name # Required
  configuration_file_changes_enabled = each.value.configuration_file_changes_enabled
  preview_environments_enabled       = each.value.preview_environments_enabled
  sku_tier                           = each.value.sku_tier
  sku_size                           = each.value.sku_size
  app_settings                       = each.value.app_settings
  tags                               = each.value.tags

  dynamic "basic_auth" {
    iterator = ba
    for_each = each.value.basic_auth

    content {
      password     = ba.value.password     # Required, wrap the input into the sensitive() function.
      environments = ba.value.environments # Required
    }
  }

  dynamic "identity" {
    iterator = i
    for_each = each.value.identity

    content {
      type         = i.value.type # Required
      identity_ids = i.value.identity_ids
    }
  }
}
