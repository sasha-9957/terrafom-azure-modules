resource "azurerm_application_insights" "this" {
  for_each = var.azurerm_application_insights_params

  name                                  = each.value.name                    # required
  resource_group_name                   = each.value.resource_group_name     # required
  location                              = each.value.location                # required
  application_type                      = each.value.application_type        # required
  workspace_id                          = each.value.workspace_id
  retention_in_days                     = each.value.retention_in_days
  sampling_percentage                   = each.value.sampling_percentage
  disable_ip_masking                    = each.value.disable_ip_masking
  daily_data_cap_in_gb                  = each.value.daily_data_cap_in_gb
  local_authentication_disabled         = each.value.local_authentication_disabled
  daily_data_cap_notifications_disabled = each.value.daily_data_cap_notifications_disabled
  internet_ingestion_enabled            = each.value.internet_ingestion_enabled
  internet_query_enabled                = each.value.internet_ingestion_enabled
  force_customer_storage_for_profiler   = each.value.force_customer_storage_for_profiler
  tags                                  = each.value.tags
}
