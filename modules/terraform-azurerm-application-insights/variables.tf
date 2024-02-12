variable "azurerm_application_insights_params" {
  description = "Object map for Azure application insights module input parameters."

  type = map(object({
    name                                  = string # Required
    location                              = string # Required
    resource_group_name                   = string # Required
    application_type                      = string # Required
    workspace_id                          = string
    daily_data_cap_in_gb                  = number
    retention_in_days                     = number
    sampling_percentage                   = number
    disable_ip_masking                    = bool
    local_authentication_disabled         = bool
    daily_data_cap_notifications_disabled = bool
    internet_ingestion_enabled            = bool
    internet_query_enabled                = bool
    force_customer_storage_for_profiler   = bool
    tags                                  = map(string)
  }))
}
