module "azurerm_linux_function_app" {
  source  = "app.terraform.io/captionhealth/linux-function-appl/azurerm"
  version = "1.0.0"

  azurerm_linux_function_app_params = {
    main_linux_function_app_params = {
      location                                       = module.resource_group.resource_groups["main_rg"].location # Required
      name                                           = "examle app"                                              # Required
      resource_group_name                            = module.resource_group.resource_groups["main_rg"].name     # Required
      service_plan_id                                = module.azurerm_service_plans["main_service_plan"].id      # Required
      app_settings                                   = null
      builtin_logging_enabled                        = null
      client_certificate_enabled                     = null
      client_certificate_mode                        = null
      client_certificate_exclusion_paths             = null
      daily_memory_time_quota                        = null
      enabled                                        = null
      content_share_force_disabled                   = null
      functions_extension_version                    = null
      ftp_publish_basic_authentication_enabled       = null
      https_only                                     = null
      public_network_access_enabled                  = null
      storage_account_access_key                     = null
      storage_account_name                           = null
      storage_uses_managed_identity                  = null # Conflicts with storage_account_access_key
      storage_key_vault_secret_id                    = null
      virtual_network_subnet_id                      = null
      webdeploy_publish_basic_authentication_enabled = null
      zip_deploy_file                                = null
      tags                                           = null

      site_config = [ # 
        {
          always_on                              = null
          api_definition_url                     = null
          api_management_api_id                  = null
          app_command_line                       = null
          app_scale_limit                        = null
          application_insights_connection_string = null
          application_insights_key               = null
        }
      ]
    }
  }
}
