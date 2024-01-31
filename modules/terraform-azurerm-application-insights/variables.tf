variable "azurerm_application_insights_params" {
  description = "Object map for Azure application insights module input parameters."
  type = map(object({
    name                                  = string # required
    location                              = string # required
    resource_group_name                   = string # required
    application_type                      = string # required
    workspace_id                          = string
    daily_data_cap_in_gb                  = number
    retention_in_days                     = number
    sampling_percentage                   = number
    disable_ip_masking                    = bool
    local_authentication_disabled         = bool
    daily_data_cap_notifications_disabled = bool
    tags                                  = map(string)
  }))
}
