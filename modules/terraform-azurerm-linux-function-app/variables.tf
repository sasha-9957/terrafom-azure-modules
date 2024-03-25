variable "azurerm_linux_function_app_params" {
  description = "Object map for linux function app module input parameters."

  type = map(object({
    location                                       = string # Required
    name                                           = string # Required
    resource_group_name                            = string # Required
    service_plan_id                                = string # Required
    app_settings                                   = map(string)
    builtin_logging_enabled                        = bool
    client_certificate_enabled                     = bool
    client_certificate_mode                        = string
    client_certificate_exclusion_paths             = string
    daily_memory_time_quota                        = number
    enabled                                        = bool
    content_share_force_disabled                   = bool
    functions_extension_version                    = string
    ftp_publish_basic_authentication_enabled       = bool
    https_only                                     = bool
    public_network_access_enabled                  = bool
    key_vault_reference_identity_id                = string
    storage_account_access_key                     = string # Conflicts with storage_uses_managed_identity
    storage_account_name                           = string
    storage_uses_managed_identity                  = bool # Conflicts with storage_account_access_key
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

      application_stack = list(object({
        dotnet_version              = string
        use_dotnet_isolated_runtime = bool
        java_version                = string
        node_version                = string
        python_version              = string
        powershell_core_version     = string
        use_custom_runtime          = string

        docker = list(object({
          registry_url      = string
          image_name        = string
          image_tag         = string
          registry_username = string
          registry_password = string # wrap the input into the sensitive() function.
        }))
      }))

      app_service_logs = list(object({
        disk_quota_mb         = number
        retention_period_days = number
      }))

      cors = list(object({
        allowed_origins     = set(string)
        support_credentials = bool
      }))

      ip_restriction = list(object({
        action                    = string
        ip_address                = string
        name                      = string
        priority                  = number
        service_tag               = string
        virtual_network_subnet_id = string
        # description               = string

        headers = list(object({
          x_azure_fdid      = list(string)
          x_fd_health_probe = list(string)
          x_forwarded_for   = list(string)
          x_forwarded_host  = list(string)
        }))
      }))

      scm_ip_restriction = list(object({
        action                    = string
        ip_address                = string
        name                      = string
        priority                  = number
        service_tag               = string
        virtual_network_subnet_id = string
        # description               = string

        headers = list(object({
          x_azure_fdid      = list(string)
          x_fd_health_probe = list(string)
          x_forwarded_for   = list(string)
          x_forwarded_host  = list(string)
        }))
      }))
    }))

    auth_settings = list(object({
      enabled                        = bool
      additional_login_parameters    = map(string)
      allowed_external_redirect_urls = set(string)
      default_provider               = string
      issuer                         = string
      runtime_version                = string
      token_refresh_extension_hours  = number
      token_store_enabled            = bool
      unauthenticated_client_action  = string

      active_directory = list(object({
        client_id                  = string
        allowed_audiences          = set(string)
        client_secret              = string # Cannot be used with client_secret_setting_name
        client_secret_setting_name = string # Cannot be used with client_secret
      }))

      facebook = list(object({
        app_id                  = string # Required
        app_secret              = string # wrap the input into the sensitive() function.
        app_secret_setting_name = string
        oauth_scopes            = list(string)
      }))

      github = list(object({
        client_id                  = string # Required
        client_secret              = string # wrap the input into the sensitive() function.
        client_secret_setting_name = string
        oauth_scopes               = list(string)
      }))

      google = list(object({
        client_id                  = string # Required
        client_secret              = string # wrap the input into the sensitive() function.
        client_secret_setting_name = string
        oauth_scopes               = list(string)
      }))

      microsoft = list(object({
        client_id                  = string # Required
        client_secret              = string # wrap the input into the sensitive() function.
        client_secret_setting_name = string
        oauth_scopes               = list(string)
      }))

      twitter = list(object({
        consumer_key                 = string # Required
        consumer_secret              = string # wrap the input into the sensitive() function.
        consumer_secret_setting_name = string
      }))
    }))

    auth_settings_v2 = list(object({
      auth_enabled                            = bool
      runtime_version                         = string
      config_file_path                        = string
      require_authentication                  = bool
      unauthenticated_action                  = string
      default_provider                        = string
      excluded_paths                          = list(string)
      require_https                           = bool
      http_route_api_prefix                   = string
      forward_proxy_convention                = string
      forward_proxy_custom_host_header_name   = string
      forward_proxy_custom_scheme_header_name = string

      apple_v2 = list(object({
        client_id                  = string # Required
        client_secret_setting_name = string # Required
        login_scopes               = list(string)
      }))

      active_directory_v2 = list(object({
        client_id                            = string # Required
        tenant_auth_endpoint                 = string # Required
        client_secret_setting_name           = string
        client_secret_certificate_thumbprint = string
        jwt_allowed_groups                   = list(string)
        jwt_allowed_client_applications      = list(string)
        www_authentication_disabled          = bool
        allowed_groups                       = list(string)
        allowed_identities                   = list(string)
        allowed_applications                 = list(string)
        login_parameters                     = map(string)
        allowed_audiences                    = list(string)
      }))

      azure_static_web_app_v2 = list(object({
        client_id = string # Required
      }))

      custom_oidc_v2 = list(object({
        name                          = string # Required
        client_id                     = string # Required
        openid_configuration_endpoint = string # Required
        name_claim_type               = string
        scopes                        = list(string)
        client_credential_method      = string
        client_secret_setting_name    = string
        authorisation_endpoint        = string
        token_endpoint                = string
        issuer_endpoint               = string
        certification_uri             = string
      }))

      facebook_v2 = list(object({
        app_id                  = string # Required
        app_secret_setting_name = string # Required
        graph_api_version       = string
        login_scopes            = list(string)
      }))

      github_v2 = list(object({
        client_id                  = string # Required
        client_secret_setting_name = string # Required
        login_scopes               = list(string)
      }))

      google_v2 = list(object({
        client_id                  = string # Required
        client_secret_setting_name = string # Required
        allowed_audiences          = list(string)
        login_scopes               = list(string)
      }))

      microsoft_v2 = list(object({
        client_id                  = string # Required
        client_secret_setting_name = string # Required
        allowed_audiences          = list(string)
        login_scopes               = list(string)
      }))

      twitter_v2 = list(object({
        consumer_key                 = string # Required
        consumer_secret_setting_name = string # Required
      }))

      login = list(object({ # Required
        logout_endpoint                   = string
        token_store_enabled               = bool
        token_refresh_extension_time      = number
        token_store_path                  = string
        token_store_sas_setting_name      = string
        preserve_url_fragments_for_logins = bool
        allowed_external_redirect_urls    = list(string)
        cookie_expiration_time            = string
        validate_nonce                    = bool
        nonce_expiration_time             = string
      }))
    }))

    backup = list(object({
      name                = string # Required
      storage_account_url = string # Required, wrap the input into the sensitive() function.
      enabled             = bool

      schedule = list(object({            # Required
        frequency_interval       = number # Required
        frequency_unit           = string # Required
        keep_at_least_one_backup = bool
        retention_period_days    = number
        start_time               = string
      }))
    }))

    connection_string = list(object({
      name  = string # Required
      type  = string # Required
      value = string # Required, wrap the input into the sensitive() function.
    }))

    identity = list(object({
      type         = string # Required
      identity_ids = set(string)
    }))

    storage_account = list(object({
      access_key   = string # Required, wrap the input into the sensitive() function.
      account_name = string # Required
      name         = string # Required
      share_name   = string # Required
      type         = string # Required
      mount_path   = string
    }))

    sticky_settings = list(object({
      app_setting_names       = list(string)
      connection_string_names = list(string)
    }))
  }))
}
