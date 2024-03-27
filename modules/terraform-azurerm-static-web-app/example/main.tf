module "static_web_app" {
  source  = "app.terraform.io/captionhealth/static-web-app/azurerm"
  version = "1.0.0"

  azurerm_static_web_app_params = {
    static_web_app_1 = {
      name                               = "dev-stamp-swebapp-eastus-tyr"                            # Required
      location                           = module.resource_group.resource_groups["main_rg"].location # Required
      resource_group_name                = module.resource_group.resource_groups["main_rg"].name     # Required
      configuration_file_changes_enabled = null
      preview_environments_enabled       = null
      sku_tier                           = null
      sku_size                           = null
      app_settings                       = null
      tags                               = module.tags.tags

      basic_auth = [
        # {
        #   password     = sensitive("OrePuENTerTI") # Required, wrap the input into the sensitive() function.
        #   environments = "StagingEnvironments"     # Required
        # }
      ]

      identity = [
        # {
        #   type         = "SystemAssigned" # Required
        #   identity_ids = null
        # }
      ]
    }
  }
}
