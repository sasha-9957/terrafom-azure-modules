resource "azurerm_log_analytics_workspace" "this" {
  for_each = var.azurerm_log_analytics_workspace_params

  name                                    = each.value.name                # Required
  resource_group_name                     = each.value.resource_group_name # Required
  location                                = each.value.location            # Required
  allow_resource_only_permissions         = each.value.allow_resource_only_permissions
  local_authentication_disabled           = each.value.local_authentication_disabled
  sku                                     = each.value.sku
  retention_in_days                       = each.value.retention_in_days
  daily_quota_gb                          = each.value.daily_quota_gb
  cmk_for_query_forced                    = each.value.cmk_for_query_forced
  internet_ingestion_enabled              = each.value.internet_ingestion_enabled
  internet_query_enabled                  = each.value.internet_query_enabled
  reservation_capacity_in_gb_per_day      = each.value.reservation_capacity_in_gb_per_day # Can only be used when the sku is set to CapacityReservation
  data_collection_rule_id                 = each.value.data_collection_rule_id
  immediate_data_purge_on_30_days_enabled = each.value.immediate_data_purge_on_30_days_enabled
  tags                                    = each.value.tags

  dynamic "identity" {
    iterator = i
    for_each = each.value.identity

    content {
      type         = i.value.type         # Required
      identity_ids = i.value.identity_ids # Required if type is UserAssigned.
    }
  }
}
