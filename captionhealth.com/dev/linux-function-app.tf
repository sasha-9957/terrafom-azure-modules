module "linux_function_app" {
  source = "../../modules/terraform-azurerm-linux-function-app"

  azurerm_linux_function_app_params = {
    dwh_linux_function_app = {
      location            = module.resource_group.resource_groups["dwh_rg"].location
      name                = "dev-linux-function-eastus-1"
      resource_group_name = module.resource_group.resource_groups["dwh_rg"].name
      service_plan_id     = module.azurerm_service_plan.service_plans["dwh_service_plan_linux"].id

      app_settings = {
        "APPINSIGHTS_INSTRUMENTATIONKEY"             = module.app_insights.application_insights["dwh_app_insights"].instrumentation_key
        "EtlStudycastMover_StudycastExchangeStorage" = module.storage_account.storage_accounts["dwh_storage_account"].primary_connection_string
        "EtlStudycastMover_TableNameToInsertReport"  = "public.study_cast2"
        "KEY_VAULT_NAME"                             = module.key_vault.key_vaults["dwh_key_vault"].name
        "studycastHandler_CheckIntervalInHours"      = "336"
        "studycastHandler_ReadDateFrom"              = "2023-09-01"
        "studycastHandler_ReadFrom"                  = "studycast-nonprod@captioncare.systems"
        "studycastHandler_ReadFromInbox"             = "inbox"
        "studycastHandler_ReadFromSender"            = "support@corestudycast.com"
        "studycastHandler_ReadTopCount"              = "15"
        "studycast_exchange_storage"                 = module.storage_account.storage_accounts["dwh_storage_account"].primary_connection_string
        "timerSchedule"                              = "0 0 * * * *"
      }

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
      key_vault_reference_identity_id                = null
      storage_account_access_key                     = null
      storage_account_name                           = module.storage_account.storage_accounts["dwh_storage_account"].name
      storage_uses_managed_identity                  = null
      storage_key_vault_secret_id                    = null
      virtual_network_subnet_id                      = module.subnet.subnets["dwh_linux_subnet"].id
      webdeploy_publish_basic_authentication_enabled = null
      zip_deploy_file                                = null
      tags                                           = module.tags.tags

      site_config = [
        {
          always_on                                     = null
          api_definition_url                            = null
          api_management_api_id                         = null
          app_command_line                              = null
          app_scale_limit                               = null
          application_insights_connection_string        = null
          application_insights_key                      = null
          container_registry_managed_identity_client_id = null
          container_registry_use_managed_identity       = null
          default_documents                             = null
          elastic_instance_minimum                      = null
          ftps_state                                    = null
          health_check_path                             = null
          health_check_eviction_time_in_min             = null
          http2_enabled                                 = null
          ip_restriction_default_action                 = null
          load_balancing_mode                           = null
          managed_pipeline_mode                         = null
          minimum_tls_version                           = null
          pre_warmed_instance_count                     = null
          remote_debugging_enabled                      = null
          remote_debugging_version                      = null
          runtime_scale_monitoring_enabled              = null
          scm_ip_restriction_default_action             = null
          scm_minimum_tls_version                       = null
          scm_use_main_ip_restriction                   = null
          use_32_bit_worker                             = null
          vnet_route_all_enabled                        = null
          websockets_enabled                            = null
          worker_count                                  = null
          application_stack = [
            {
              dotnet_version              = "8.0"
              use_dotnet_isolated_runtime = true
              java_version                = null
              node_version                = null
              python_version              = null
              powershell_core_version     = null
              use_custom_runtime          = null
              docker                      = []
            }
          ]
          app_service_logs = []
          cors = [
            {
              allowed_origins     = ["https://portal.azure.com"]
              support_credentials = null
            }
          ]
          ip_restriction     = []
          scm_ip_restriction = []
        }
      ]
      auth_settings     = []
      auth_settings_v2  = []
      backup            = []
      connection_string = []
      identity = [
        {
          type         = "SystemAssigned"
          identity_ids = null
        }
      ]
      storage_account = []
      sticky_settings = []
    }
  }
}
