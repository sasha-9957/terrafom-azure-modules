variable "azurerm_static_web_app_params" {
  description = "Object map for Azure Static Web App module input parameters."
  type = map(object({
    name                               = string # Required
    location                           = string # Required
    resource_group_name                = string # Required
    configuration_file_changes_enabled = bool
    preview_environments_enabled       = bool
    sku_tier                           = string
    sku_size                           = string
    app_settings                       = map(string)
    tags                               = map(string)

    basic_auth = list(object({
      password     = string # Required, wrap the input into the sensitive() function.
      environments = string # Required
    }))

    identity = list(object({
      type         = string # Required
      identity_ids = set(string)
    }))
  }))
}
