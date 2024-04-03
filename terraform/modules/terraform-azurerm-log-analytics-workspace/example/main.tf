module "azurerm_log_analytics_workspace" {
  source  = "app.terraform.io/captionhealth/terraform-azurerm-log-analytics-workspace/azurerm"
  version = "1.0.0"

  azurerm_log_analytics_workspace_params = {
    main_log_analytics_workspace = {
      name                                    = module.name.names["main_log_analytics_workspace"].result  # Required
      resource_group_name                     = module.resource_group.resource_groups["main_rg"].name     # Required
      location                                = module.resource_group.resource_groups["main_rg"].location # Required
      allow_resource_only_permissions         = null
      local_authentication_disabled           = null
      sku                                     = null
      retention_in_days                       = null
      daily_quota_gb                          = null
      cmk_for_query_forced                    = null
      internet_ingestion_enabled              = null
      internet_query_enabled                  = null
      reservation_capacity_in_gb_per_day      = null # Can only be used when the sku is set to CapacityReservation
      data_collection_rule_id                 = null
      immediate_data_purge_on_30_days_enabled = null
      tags                                    = module.tags.tags

      identity = [
        # {
        #   type         = "SystemAssigned" # Required
        #   identity_ids = null             # Required if type is UserAssigned
        # }
      ]
    }
  }
}
