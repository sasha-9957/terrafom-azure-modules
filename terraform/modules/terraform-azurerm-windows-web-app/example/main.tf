module "windows_web_app" {
  source  = "app.terraform.io/captionhealth/windows-web-app/azurerm"
  version = "1.0.0"

  azurerm_windows_web_app_params = {
    windows_web_app1 = {
      location                                       = module.resource_group.resource_groups["main_rg"].location # Required
      name                                           = "dev-stamp-winapp-eastus-1"                               # Required
      resource_group_name                            = module.resource_group.resource_groups["main_rg"].name     # Required
      service_plan_id                                = module.service_plan.service_plans["service_plan1"].id     # Required
      app_settings                                   = null
      client_affinity_enabled                        = null
      client_certificate_enabled                     = null
      client_certificate_mode                        = null
      client_certificate_exclusion_paths             = null
      enabled                                        = null
      ftp_publish_basic_authentication_enabled       = null
      https_only                                     = null
      public_network_access_enabled                  = null
      key_vault_reference_identity_id                = null
      tags                                           = null
      virtual_network_subnet_id                      = null
      webdeploy_publish_basic_authentication_enabled = null
      zip_deploy_file                                = null

      site_config = [ # Required
        {
          always_on                                     = null
          api_definition_url                            = null
          api_management_api_id                         = null
          app_command_line                              = null
          auto_heal_enabled                             = null
          container_registry_managed_identity_client_id = null
          container_registry_use_managed_identity       = null
          default_documents                             = null
          ftps_state                                    = null
          health_check_path                             = null
          health_check_eviction_time_in_min             = null
          http2_enabled                                 = null
          ip_restriction_default_action                 = null
          load_balancing_mode                           = null
          local_mysql_enabled                           = null
          managed_pipeline_mode                         = null
          minimum_tls_version                           = null
          remote_debugging_enabled                      = null
          remote_debugging_version                      = null
          scm_ip_restriction_default_action             = null
          scm_minimum_tls_version                       = null
          scm_use_main_ip_restriction                   = null
          use_32_bit_worker                             = null
          vnet_route_all_enabled                        = null
          websockets_enabled                            = null
          worker_count                                  = null

          application_stack = [
            # {
            #   current_stack                = null
            #   docker_image_name            = null
            #   docker_registry_url          = null
            #   docker_registry_username     = null
            #   docker_registry_password     = null # wrap the input into the sensitive() function.
            #   docker_container_name        = null
            #   docker_container_tag         = null
            #   dotnet_version               = null
            #   dotnet_core_version          = null
            #   tomcat_version               = null
            #   java_embedded_server_enabled = null
            #   java_version                 = null
            #   node_version                 = null
            #   php_version                  = null
            #   python                       = null
            # }
          ]

          auto_heal_setting = [
            # {
            #   action = [ # Required
            #     {
            #       action_type                    = an.value.action_type # Required
            #       minimum_process_execution_time = an.value.minimum_process_execution_time

            #       custom_action = [
            #         {
            #           executable = ca.value.executable # Required
            #           parameters = ca.value.parameters
            #         }
            #       ]
            #     }
            #   ]

            #   trigger = [ # Required
            #     {
            #       private_memory_kb = tr.validate_nonce.private_memory_kb

            #       requests = [
            #         {
            #           count    = 2          # Required
            #           interval = "00:05:00" # Required
            #         }
            #       ]
            #     }
            #   ]

            #   slow_request = [
            #     {
            #       count      = 2          # Required
            #       interval   = "00:10:00" # Required
            #       time_taken = "00:15:00" # Required
            #       path       = null
            #     }
            #   ]

            #   status_code = [
            #     {
            #       count             = 3          # Required
            #       interval          = "00:15:00" # Required
            #       status_code_range = ["500"]    # Required
            #       path              = null
            #       sub_status        = null
            #       win32_status      = null
            #     }
            #   ]
            # }
          ]

          cors = [
            # {
            #   allowed_origins     = ["portal.azure.com"]
            #   support_credentials = null
            # }
          ]

          ip_restriction = [
            # {
            #   action                    = null
            #   ip_address                = null
            #   name                      = null
            #   priority                  = null
            #   service_tag               = null
            #   virtual_network_subnet_id = null
            #   # description               = null

            #   headers = [
            #     {
            #       x_azure_fdid      = null
            #       x_fd_health_probe = null
            #       x_forwarded_for   = null
            #       x_forwarded_host  = null
            #     }
            #   ]
            # }
          ]

          scm_ip_restriction = [
            # {
            #   action                    = null
            #   ip_address                = null
            #   name                      = null
            #   priority                  = null
            #   service_tag               = null
            #   virtual_network_subnet_id = null
            #   # description               = null

            #   headers = [
            #     {
            #       x_azure_fdid      = null
            #       x_fd_health_probe = null
            #       x_forwarded_for   = null
            #       x_forwarded_host  = null
            #     }
            #   ]
            # }
          ]

          virtual_application = [
            # {
            #   physical_path = ""   # Required
            #   preload       = true # Required
            #   virtual_path  = ""   # Required

            #   virtual_directory = [
            #     {
            #       physical_path = null
            #       virtual_path  = null
            #     }
            #   ]
            # }
          ]
        }
      ]

      auth_settings = [
        # {
        #   enabled                        = false # Required
        #   additional_login_parameters    = null
        #   allowed_external_redirect_urls = null
        #   default_provider               = null
        #   issuer                         = null
        #   runtime_version                = null
        #   token_refresh_extension_hours  = null
        #   token_store_enabled            = null
        #   unauthenticated_client_action  = null

        #   active_directory = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["service_principal1"].id # Required
        #       allowed_audiences          = null
        #       client_secret              = sensitive(module.service_principal_password.service_principal_passwords["service_principal1"].value) # wrap the input into the sensitive() function.
        #       client_secret_setting_name = null
        #     }
        #   ]

        #   facebook = [
        #     {
        #       app_id                  = module.azuread_service_principal.service_principals["facebeook_app"].id                         # Required
        #       app_secret              = sensitive(module.service_principal_password.service_principal_passwords["facebeook_app"].value) # wrap the input into the sensitive() function.
        #       app_secret_setting_name = null
        #       oauth_scopes            = null
        #     }
        #   ]

        #   github = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["github_app"].id                         # Required
        #       client_secret              = sensitive(module.service_principal_password.service_principal_passwords["github_app"].value) # wrap the input into the sensitive() function.
        #       client_secret_setting_name = null
        #       oauth_scopes               = null
        #     }
        #   ]

        #   google = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["google_app"].id                         # Required
        #       client_secret              = sensitive(module.service_principal_password.service_principal_passwords["google_app"].value) # wrap the input into the sensitive() function.
        #       client_secret_setting_name = null
        #       oauth_scopes               = null
        #     }
        #   ]

        #   microsoft = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["microsoft_app"].id                         # Required
        #       client_secret              = sensitive(module.service_principal_password.service_principal_passwords["microsoft_app"].value) # wrap the input into the sensitive() function.
        #       client_secret_setting_name = null
        #       oauth_scopes               = null
        #     }
        #   ]

        #   twitter = [
        #     {
        #       consumer_key                 = module.azuread_service_principal.service_principals["twitter_app"].id                         # Required
        #       consumer_secret              = sensitive(module.service_principal_password.service_principal_passwords["twitter_app"].value) # wrap the input into the sensitive() function.
        #       consumer_secret_setting_name = null
        #     }
        #   ]
        # }
      ]

      auth_settings_v2 = [
        # {
        #   auth_enabled                            = null
        #   runtime_version                         = null
        #   config_file_path                        = null
        #   require_authentication                  = null
        #   unauthenticated_action                  = null
        #   default_provider                        = null
        #   excluded_paths                          = null
        #   require_https                           = null
        #   http_route_api_prefix                   = null
        #   forward_proxy_convention                = null
        #   forward_proxy_custom_host_header_name   = null
        #   forward_proxy_custom_scheme_header_name = null

        #   apple_v2 = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["apple_v2_app"].id                                    # Required
        #       client_secret_setting_name = sensitive(module.service_principal_password.service_principal_passwords["twittapple_v2_apper_app"].value) # Required
        #       login_scopes               = apv2.value.login_scopes
        #     }
        #   ]

        #   active_directory_v2 = [
        #     {
        #       client_id                            = module.azuread_service_principal.service_principals["service_principal2"].id # Required
        #       tenant_auth_endpoint                 = "https://login.microsoftonline.com/v2.0/{tenant-guid}/"                      # Required
        #       client_secret_setting_name           = null
        #       client_secret_certificate_thumbprint = null
        #       jwt_allowed_groups                   = null
        #       jwt_allowed_client_applications      = null
        #       www_authentication_disabled          = null
        #       allowed_groups                       = null
        #       allowed_identities                   = null
        #       allowed_applications                 = null
        #       login_parameters                     = null
        #       allowed_audiences                    = null
        #     }
        #   ]

        #   azure_static_web_app_v2 = [
        #     {
        #       client_id = module.azuread_service_principal.service_principals["static_web_app1"].id # Required
        #     }
        #   ]

        #   custom_oidc_v2 = [
        #     {
        #       name                          = "MYOIDC_PROVIDER_AUTHENTICATION_SECRET"                                    # Required
        #       client_id                     = module.azuread_service_principal.service_principals["myoidc_v2_app1"].id   # Required
        #       openid_configuration_endpoint = module.azuread_service_principal.service_principals["myoidc_v2_app1"].name # Required
        #       name_claim_type               = null
        #       scopes                        = null
        #       client_credential_method      = null
        #       client_secret_setting_name    = null
        #       authorisation_endpoint        = null
        #       token_endpoint                = null
        #       issuer_endpoint               = null
        #       certification_uri             = null
        #     }
        #   ]

        #   facebook_v2 = [
        #     {
        #       app_id                  = module.azuread_service_principal.service_principals["facebook_v2_app1"].id   # Required
        #       app_secret_setting_name = module.azuread_service_principal.service_principals["facebook_v2_app1"].name # Required
        #       graph_api_version       = null
        #       login_scopes            = null
        #     }
        #   ]

        #   github_v2 = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["github_v2_app1"].id   # Required
        #       client_secret_setting_name = module.azuread_service_principal.service_principals["github_v2_app1"].name # Required
        #       login_scopes               = null
        #     }
        #   ]

        #   google_v2 = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["google_v2_app1"].id   # Required
        #       client_secret_setting_name = module.azuread_service_principal.service_principals["google_v2_app1"].name # Required
        #       allowed_audiences          = null
        #       login_scopes               = null
        #     }
        #   ]

        #   microsoft_v2 = [
        #     {
        #       client_id                  = module.azuread_service_principal.service_principals["microsoft_v2_app1"].id   # Required
        #       client_secret_setting_name = module.azuread_service_principal.service_principals["microsoft_v2_app1"].name # Required
        #       allowed_audiences          = null
        #       login_scopes               = null
        #     }
        #   ]

        #   twitter_v2 = [
        #     {
        #       consumer_key                 = module.azuread_service_principal.service_principals["twitter_v2_app"].id                         # Required
        #       consumer_secret_setting_name = sensitive(module.service_principal_password.service_principal_passwords["twitter_v2_app"].value) # Required
        #     }
        #   ]

        #   login = [ # Required
        #     {
        #       logout_endpoint                   = null
        #       token_store_enabled               = null
        #       token_refresh_extension_time      = null
        #       token_store_path                  = null
        #       token_store_sas_setting_name      = null
        #       preserve_url_fragments_for_logins = null
        #       allowed_external_redirect_urls    = null
        #       cookie_expiration_time            = null
        #       validate_nonce                    = null
        #       nonce_expiration_time             = null
        #     }
        #   ]
        # }
      ]

      backup = [
        # {
        #   name                = "mybackup"                                                           # Required
        #   storage_account_url = sensitive(data.azurerm_storage_account_sas.main_storage_account.sas) # Required, wrap the input into the sensitive() function.
        #   enabled             = null

        #   schedule = [ # Required
        #     {
        #       frequency_interval       = 7     # Required
        #       frequency_unit           = "Day" # Required
        #       keep_at_least_one_backup = null
        #       retention_period_days    = null
        #       start_time               = null
        #     }
        #   ]
        # }
      ]

      connection_string = [
        # {
        #   name  = "myconnectionstring"      # Required
        #   type  = "SQLAzure"                # Required
        #   value = "myconnectionstringvalue" # Required, wrap the input into the sensitive() function.
        # }
      ]

      identity = [
        # {
        #   type         = "SystemAssigned" # Required
        #   identity_ids = null
        # }
      ]

      logs = [
        # {
        #   detailed_error_messages = null
        #   failed_request_tracing  = null

        #   application_logs = [
        #     {
        #       file_system_level = "Off" # Required

        #       azure_blob_storage = [
        #         {
        #           level             = "Error"                                                   # Required
        #           retention_in_days = 0                                                         # Required
        #           sas_url           = data.azurerm_storage_account_sas.main_storage_account.sas # Required
        #         }
        #       ]
        #     }
        #   ]

        #   http_logs = [
        #     {
        #       azure_blob_storage = [
        #         {
        #           retention_in_days = 0                                                         # Required
        #           sas_url           = data.azurerm_storage_account_sas.main_storage_account.sas # Required
        #         }
        #       ]

        #       file_system = [
        #         {
        #           retention_in_days = 0    # Required
        #           retention_in_mb   = 1024 # Required
        #         }
        #       ]
        #     }
        #   ]
        # }
      ]

      sticky_settings = [
        # {
        #   app_setting_names       = null
        #   connection_string_names = null
        # }
      ]

      storage_account = [
        # {
        #   access_key   = sensitive(data.azurerm_storage_account_keys.main_storage_account.keys[0].value) # Required, wrap the input into the sensitive() function.
        #   account_name = module.storage_account.storage_accounts["main_storage_account"].name            # Required
        #   name         = "somename"                                                                      # Required
        #   share_name   = "sharedfolder"                                                                  # Required
        #   type         = "AzureBlob"                                                                     # Required
        #   mount_path   = null
        # }
      ]
    }
  }
}
