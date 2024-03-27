variable "azurerm_windows_web_app_params" {
  description = "Object map for Azure Resource Groups module input parameters."
  type = map(object({
    location                                       = string # Required
    name                                           = string # Required
    resource_group_name                            = string # Required
    service_plan_id                                = string # Required
    app_settings                                   = map(string)
    client_affinity_enabled                        = bool
    client_certificate_enabled                     = bool
    client_certificate_mode                        = string
    client_certificate_exclusion_paths             = string
    enabled                                        = bool
    ftp_publish_basic_authentication_enabled       = bool
    https_only                                     = bool
    public_network_access_enabled                  = bool
    key_vault_reference_identity_id                = string
    tags                                           = map(string)
    virtual_network_subnet_id                      = string
    webdeploy_publish_basic_authentication_enabled = bool
    zip_deploy_file                                = string

    site_config = list(object({ # Required
      always_on                                     = bool
      api_definition_url                            = string
      api_management_api_id                         = string
      app_command_line                              = string
      auto_heal_enabled                             = bool
      container_registry_managed_identity_client_id = string
      container_registry_use_managed_identity       = bool
      default_documents                             = list(string)
      ftps_state                                    = string
      health_check_path                             = string
      health_check_eviction_time_in_min             = number
      http2_enabled                                 = bool
      ip_restriction_default_action                 = string
      load_balancing_mode                           = string
      local_mysql_enabled                           = bool
      managed_pipeline_mode                         = string
      minimum_tls_version                           = string
      remote_debugging_enabled                      = bool
      remote_debugging_version                      = string
      scm_ip_restriction_default_action             = string
      scm_minimum_tls_version                       = string
      scm_use_main_ip_restriction                   = bool
      use_32_bit_worker                             = bool
      vnet_route_all_enabled                        = bool
      websockets_enabled                            = bool
      worker_count                                  = number

      application_stack = list(object({
        current_stack                = string
        docker_image_name            = string
        docker_registry_url          = string
        docker_registry_username     = string
        docker_registry_password     = string # wrap the input into the sensitive() function.
        docker_container_name        = string
        docker_container_tag         = string
        dotnet_version               = string
        dotnet_core_version          = string
        tomcat_version               = string
        java_embedded_server_enabled = bool
        java_version                 = string
        node_version                 = string
        php_version                  = string
        python                       = bool
      }))

      auto_heal_setting = list(object({
        action = list(object({                    # Required
          action_type                    = string # Required
          minimum_process_execution_time = string

          custom_action = list(object({
            executable = string # Required
            parameters = string
          }))
        }))

        trigger = list(object({ # Required
          private_memory_kb = number

          requests = list(object({
            count    = number # Required
            interval = string # Required
          }))

          slow_request = list(object({
            count      = number # Required
            interval   = string # Required
            time_taken = string # Required
            path       = string
          }))

          status_code = list(object({
            count             = number # Required
            interval          = string # Required
            status_code_range = string # Required
            path              = string
            sub_status        = number
            win32_status      = number
          }))
        }))
      }))

      cors = list(object({
        allowed_origins     = set(string)
        support_credentials = bool

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

        virtual_application = list(object({
          physical_path = string # Required
          preload       = bool   # Required
          virtual_path  = string # Required

          virtual_directory = list(object({
            physical_path = string
            virtual_path  = string
          }))
        }))
      }))
    }))

    auth_settings = list(object({
      enabled                        = bool # Required
      additional_login_parameters    = map(string)
      allowed_external_redirect_urls = list(string)
      default_provider               = string
      issuer                         = string
      runtime_version                = string
      token_refresh_extension_hours  = number
      token_store_enabled            = bool
      unauthenticated_client_action  = string

      active_directory = list(object({
        client_id                  = string # Required
        allowed_audiences          = list(string)
        client_secret              = string # wrap the input into the sensitive() function.
        client_secret_setting_name = string
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

    logs = list(object({
      detailed_error_messages = bool
      failed_request_tracing  = bool

      application_logs = list(object({
        file_system_level = string # Required

        azure_blob_storage = list(object({
          level             = string # Required
          retention_in_days = number # Required
          sas_url           = string # Required
        }))
      }))

      http_logs = list(object({
        azure_blob_storage = list(object({
          retention_in_days = number # Required
          sas_url           = string # Required, wrap the input into the sensitive() function.
        }))

        file_system = list(object({
          retention_in_days = number # Required
          retention_in_mb   = number # Required
        }))
      }))
    }))

    sticky_settings = list(object({
      app_setting_names       = list(string)
      connection_string_names = list(string)
    }))

    storage_account = list(object({
      access_key   = string # Required, wrap the input into the sensitive() function.
      account_name = string # Required
      name         = string # Required
      share_name   = string # Required
      type         = string # Required
      mount_path   = string
    }))
  }))
}
