module "application_insights" {
  source = "app.terraform.io/captionhealth/application-insights/azurerm"
  version = "1.0.0"

  azurerm_application_insights_params = {
    application_insights = {
      name                                  = "app-insights-name"                                   # Required
      location                              = local.location                                        # Required
      resource_group_name                   = module.resource_group.resource_groups["main_rg"].name # Required
      application_type                      = "web"                                                 # Required
      workspace_id                          = null
      retention_in_days                     = null
      sampling_percentage                   = null
      disable_ip_masking                    = null
      daily_data_cap_in_gb                  = null
      local_authentication_disabled         = null
      daily_data_cap_notifications_disabled = null
      internet_ingestion_enabled            = null
      internet_query_enabled                = null
      force_customer_storage_for_profiler   = null
      tags                                  = module.tags.tags
    }
  }
}