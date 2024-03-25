resource "azurerm_linux_function_app" "this" {
  for_each = var.azurerm_linux_function_app_params

  location                                       = each.value.location            # Required
  name                                           = each.value.name                # Required
  resource_group_name                            = each.value.resource_group_name # Required
  service_plan_id                                = each.value.service_plan_id     # Required
  app_settings                                   = each.value.app_settings
  builtin_logging_enabled                        = each.value.builtin_logging_enabled
  client_certificate_enabled                     = each.value.client_certificate_enabled
  client_certificate_mode                        = each.value.client_certificate_mode
  client_certificate_exclusion_paths             = each.value.client_certificate_exclusion_paths
  daily_memory_time_quota                        = each.value.daily_memory_time_quota
  enabled                                        = each.value.enabled
  content_share_force_disabled                   = each.value.content_share_force_disabled
  functions_extension_version                    = each.value.functions_extension_version #?
  ftp_publish_basic_authentication_enabled       = each.value.ftp_publish_basic_authentication_enabled
  https_only                                     = each.value.https_only
  public_network_access_enabled                  = each.value.public_network_access_enabled
  storage_account_access_key                     = each.value.storage_account_access_key
  storage_account_name                           = each.value.storage_account_name
  storage_uses_managed_identity                  = each.value.storage_uses_managed_identity # Conflicts with storage_account_access_key
  storage_key_vault_secret_id                    = each.value.storage_key_vault_secret_id
  virtual_network_subnet_id                      = each.value.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = each.value.webdeploy_publish_basic_authentication_enabled
  zip_deploy_file                                = each.value.zip_deploy_file

  dynamic "site_config" {
    iterator = st
    for_each = each.value.site_config

    content {
      always_on                                     = st.value.always_on
      api_definition_url                            = st.value.api_definition_url
      api_management_api_id                         = st.value.api_management_api_id
      app_command_line                              = st.value.app_command_line
      app_scale_limit                               = st.value.app_scale_limit
      application_insights_connection_string        = st.value.application_insights_connection_string
      application_insights_key                      = st.value.application_insights_key
      container_registry_managed_identity_client_id = st.value.container_registry_managed_identity_client_id
      container_registry_use_managed_identity       = st.value.container_registry_use_managed_identity
      default_documents                             = st.value.default_documents
      elastic_instance_minimum                      = st.value.elastic_instance_minimum
      ftps_state                                    = st.value.ftps_state
      health_check_path                             = st.value.health_check_path
      health_check_eviction_time_in_min             = st.value.health_check_eviction_time_in_min
      http2_enabled                                 = st.value.http2_enabled
      ip_restriction_default_action                 = st.value.ip_restriction_default_action
      load_balancing_mode                           = st.value.load_balancing_mode
      managed_pipeline_mode                         = st.value.managed_pipeline_mode
      minimum_tls_version                           = st.value.minimum_tls_version
      pre_warmed_instance_count                     = st.value.pre_warmed_instance_count
      remote_debugging_enabled                      = st.value.remote_debugging_enabled
      remote_debugging_version                      = st.value.remote_debugging_version
      runtime_scale_monitoring_enabled              = st.value.runtime_scale_monitoring_enabled
      scm_ip_restriction_default_action             = st.value.scm_ip_restriction_default_action
      scm_minimum_tls_version                       = st.value.scm_minimum_tls_version
      scm_use_main_ip_restriction                   = st.value.scm_use_main_ip_restriction
      use_32_bit_worker                             = st.value.use_32_bit_worker
      vnet_route_all_enabled                        = st.value.vnet_route_all_enabled
      websockets_enabled                            = st.value.websockets_enabled
      worker_count                                  = st.value.worker_count
    }
  }

  dynamic "auth_settings" {
    iterator = as
    for_each = each.value.auth_settings

    content {
      enabled                        = as.value.enabled
      additional_login_parameters    = as.value.additional_login_parameters
      allowed_external_redirect_urls = as.value.allowed_external_redirect_urls
      default_provider               = as.value.default_provider

      dynamic "active_directory" {
        iterator = ad
        for_each = each.value.active_directory

        content {
          client_id                  = ad.value.client_id
          allowed_audiences          = ad.value.allowed_audiences
          client_secret              = ad.value.client_secret
          client_secret_setting_name = ad.value.client_secret_setting_name
        }
      }
    }
  }
}




    #   auth_settings = list(object({
    # enabled                        = bool
    # additional_login_parameters    = map(string)
    # allowed_external_redirect_urls = string
    # default_provider               = string

    # active_directory = list(object({
    #   client_id                  = string
    #   allowed_audiences          = set(string)
    #   client_secret              = string
    #   client_secret_setting_name = string