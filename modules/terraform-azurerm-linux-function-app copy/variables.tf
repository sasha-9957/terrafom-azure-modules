variable "azurerm_linux_function_app_params" {
  description = "Object map for linux function app module input parameters."

  type = map(object({
    location                                       = string # Required
    name                                           = string # Required
    resource_group_name                            = string # Required
    service_plan_id                                = string # Required
    app_settings                                   = map(string)
    builtin_logging_enabled                        = bool
    client_certificate_enabled                     = string
    client_certificate_mode                        = string
    client_certificate_exclusion_paths             = string
    daily_memory_time_quota                        = number
    enabled                                        = bool
    content_share_force_disabled                   = bool
    functions_extension_version                    = string
    ftp_publish_basic_authentication_enabled       = bool
    https_only                                     = bool
    public_network_access_enabled                  = bool
    storage_account_access_key                     = string
    storage_account_name                           = string
    storage_uses_managed_identity                  = string # Conflicts with storage_account_access_key
    storage_key_vault_secret_id                    = string
    virtual_network_subnet_id                      = string
    webdeploy_publish_basic_authentication_enabled = bool
    zip_deploy_file                                = string
    tags                                           = map(string)

    site_config = list(object({ # Required
      always_on                                     = bool
      api_definition_url                            = string
      api_management_api_id                         = string
      app_command_line                              = string
      app_scale_limit                               = number
      application_insights_connection_string        = string
      application_insights_key                      = string
      container_registry_managed_identity_client_id = string
      container_registry_use_managed_identity       = bool
      default_documents                             = set(string)
      elastic_instance_minimum                      = number
      ftps_state                                    = string
      health_check_path                             = string
      health_check_eviction_time_in_min             = number
      http2_enabled                                 = bool
      ip_restriction_default_action                 = string
      load_balancing_mode                           = string
      managed_pipeline_mode                         = string
      minimum_tls_version                           = string
      pre_warmed_instance_count                     = number
      remote_debugging_enabled                      = bool
      remote_debugging_version                      = string
      runtime_scale_monitoring_enabled              = bool
      scm_ip_restriction_default_action             = string
      scm_minimum_tls_version                       = string
      scm_use_main_ip_restriction                   = bool
      use_32_bit_worker                             = bool
      vnet_route_all_enabled                        = bool
      websockets_enabled                            = bool
      worker_count                                  = number

    auth_settings = list(object({
      enabled                        = bool
      additional_login_parameters    = map(string)
      allowed_external_redirect_urls = string
      default_provider               = string

        active_directory = list(object({
          client_id                  = string
          allowed_audiences          = set(string)
          client_secret              = string
          client_secret_setting_name = string
        }))
      }))
    }))
  }))
}
      # auth_settings_v2
      # backup
      # connection_string
      # identity 
      # key_vault_reference_identity_id ###
      # storage_account 
      # sticky_settings
      # active_directory 
      # scm_ip_restriction

# active_directory = list(object({
#   client_id                  = string
#   allowed_audiences          = set(string)
#   client_secret              = string # Cannot be used with client_secret_setting_name
#   client_secret_setting_name = string # Cannot be used with client_secret
# }))

# application_stack = list(object({ # Required
#   docker = list(object({
#     registry_url      = string # Required
#     image_name        = string # Required
#     image_tag         = string # Required
#     registry_username = string
#   }))
#   dotnet_version              = string
#   use_dotnet_isolated_runtime = bool
#   java_version                = string
#   node_version                = string
#   python_version              = string
#   powershell_core_version     = string
#   use_custom_runtime          = string
# }))

# app_service_logs = list(object({ # This block is not supported on Consumption plans.
#   disk_quota_mb         = string # ?
#   retention_period_days = number # ?
# }))

# active_directory = list(object({
#   client_id                  = string
#   allowed_audiences          = set(string)
#   client_secret              = string # Cannot be used with client_secret_setting_name
#   client_secret_setting_name = string # Cannot be used with client_secret