variable "azurerm_log_analytics_workspace_params" {
  description = "Object map for Azure Log Analytics Workspace module input parameters."

  type = map(object({
    name                                    = string # Required
    resource_group_name                     = string # Required
    location                                = string # Required
    allow_resource_only_permissions         = bool
    local_authentication_disabled           = bool
    sku                                     = string
    retention_in_days                       = number
    daily_quota_gb                          = number
    cmk_for_query_forced                    = bool
    internet_ingestion_enabled              = bool
    internet_query_enabled                  = bool
    reservation_capacity_in_gb_per_day      = number # Can only be used when the sku is set to CapacityReservation
    data_collection_rule_id                 = string
    immediate_data_purge_on_30_days_enabled = bool
    tags                                    = map(string)

    identity = list(object({
      type         = string      # Required
      identity_ids = set(string) # Required if type is UserAssigned.
    }))
  }))
}
