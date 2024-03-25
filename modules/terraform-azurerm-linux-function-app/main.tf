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
  functions_extension_version                    = each.value.functions_extension_version
  ftp_publish_basic_authentication_enabled       = each.value.ftp_publish_basic_authentication_enabled
  https_only                                     = each.value.https_only
  public_network_access_enabled                  = each.value.public_network_access_enabled
  key_vault_reference_identity_id                = each.value.key_vault_reference_identity_id
  storage_account_access_key                     = each.value.storage_account_access_key # Conflicts with storage_uses_managed_identity
  storage_account_name                           = each.value.storage_account_name
  storage_uses_managed_identity                  = each.value.storage_uses_managed_identity # Conflicts with storage_account_access_key
  storage_key_vault_secret_id                    = each.value.storage_key_vault_secret_id
  virtual_network_subnet_id                      = each.value.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = each.value.webdeploy_publish_basic_authentication_enabled
  zip_deploy_file                                = each.value.zip_deploy_file

  dynamic "site_config" {
    iterator = sc
    for_each = each.value.site_config

    content {
      always_on                                     = sc.value.always_on
      api_definition_url                            = sc.value.api_definition_url
      api_management_api_id                         = sc.value.api_management_api_id
      app_command_line                              = sc.value.app_command_line
      app_scale_limit                               = sc.value.app_scale_limit
      application_insights_connection_string        = sc.value.application_insights_connection_string
      application_insights_key                      = sc.value.application_insights_key
      container_registry_managed_identity_client_id = sc.value.container_registry_managed_identity_client_id
      container_registry_use_managed_identity       = sc.value.container_registry_use_managed_identity
      default_documents                             = sc.value.default_documents
      elastic_instance_minimum                      = sc.value.elastic_instance_minimum
      ftps_state                                    = sc.value.ftps_state
      health_check_path                             = sc.value.health_check_path
      health_check_eviction_time_in_min             = sc.value.health_check_eviction_time_in_min
      http2_enabled                                 = sc.value.http2_enabled
      ip_restriction_default_action                 = sc.value.ip_restriction_default_action
      load_balancing_mode                           = sc.value.load_balancing_mode
      managed_pipeline_mode                         = sc.value.managed_pipeline_mode
      minimum_tls_version                           = sc.value.minimum_tls_version
      pre_warmed_instance_count                     = sc.value.pre_warmed_instance_count
      remote_debugging_enabled                      = sc.value.remote_debugging_enabled
      remote_debugging_version                      = sc.value.remote_debugging_version
      runtime_scale_monitoring_enabled              = sc.value.runtime_scale_monitoring_enabled
      scm_ip_restriction_default_action             = sc.value.scm_ip_restriction_default_action
      scm_minimum_tls_version                       = sc.value.scm_minimum_tls_version
      scm_use_main_ip_restriction                   = sc.value.scm_use_main_ip_restriction
      use_32_bit_worker                             = sc.value.use_32_bit_worker
      vnet_route_all_enabled                        = sc.value.vnet_route_all_enabled
      websockets_enabled                            = sc.value.websockets_enabled
      worker_count                                  = sc.value.worker_count

      dynamic "application_stack" {
        iterator = appst
        for_each = sc.value.application_stack

        content {
          dotnet_version              = sc.value.dotnet_version
          use_dotnet_isolated_runtime = sc.value.use_dotnet_isolated_runtime
          java_version                = sc.value.java_version
          node_version                = sc.value.node_version
          python_version              = sc.value.python_version
          powershell_core_version     = sc.value.powershell_core_version
          use_custom_runtime          = sc.value.use_custom_runtime

          dynamic "docker" {
            iterator = d
            for_each = appst.value.docker

            content {
              registry_url      = d.value.registry_url
              image_name        = d.value.image_name
              image_tag         = d.value.image_tag
              registry_username = d.value.registry_username
              registry_password = d.value.registry_password # wrap the input into the sensitive() function.
            }
          }
        }
      }

      dynamic "app_service_logs" {
        iterator = appsl
        for_each = sc.value.app_service_logs

        content {
          disk_quota_mb         = appsl.value.disk_quota_mb
          retention_period_days = appsl.value.retention_period_days
        }
      }

      dynamic "cors" {
        iterator = cors
        for_each = sc.value.cors

        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }

      dynamic "ip_restriction" {
        iterator = ipr
        for_each = sc.value.ip_restriction

        content {
          action                    = ipr.value.action
          ip_address                = ipr.value.ip_address
          name                      = ipr.value.name
          priority                  = ipr.value.priority
          service_tag               = ipr.value.service_tag
          virtual_network_subnet_id = ipr.value.virtual_network_subnet_id

          dynamic "headers" {
            iterator = h
            for_each = ipr.value.headers

            content {
              x_azure_fdid      = h.value.x_azure_fdid
              x_fd_health_probe = h.value.x_fd_health_probe
              x_forwarded_for   = h.value.x_forwarded_for
              x_forwarded_host  = h.value.x_forwarded_host
            }
          }
        }
      }

      dynamic "scm_ip_restriction" {
        iterator = sir
        for_each = sc.value.scm_ip_restriction

        content {
          action                    = sir.value.action
          ip_address                = sir.value.ip_address
          name                      = sir.value.name
          priority                  = sir.value.priority
          service_tag               = sir.value.service_tag
          virtual_network_subnet_id = sir.value.virtual_network_subnet_id
          # description               = sir.value.description

          dynamic "headers" {
            iterator = h
            for_each = sir.value.headers

            content {
              x_azure_fdid      = h.value.x_azure_fdid
              x_fd_health_probe = h.value.x_fd_health_probe
              x_forwarded_for   = h.value.x_forwarded_for
              x_forwarded_host  = h.value.x_forwarded_host
            }
          }
        }
      }
    }
  }

  dynamic "auth_settings" {
    iterator = as
    for_each = each.value.auth_settings

    content {
      enabled                        = as.value.enabled # Required
      additional_login_parameters    = as.value.additional_login_parameters
      allowed_external_redirect_urls = as.value.allowed_external_redirect_urls
      default_provider               = as.value.default_provider
      issuer                         = as.value.issuer
      runtime_version                = as.value.runtime_version
      token_refresh_extension_hours  = as.value.token_refresh_extension_hours
      token_store_enabled            = as.value.token_store_enabled
      unauthenticated_client_action  = as.value.unauthenticated_client_action

      dynamic "active_directory" {
        iterator = ad
        for_each = as.value.active_directory

        content {
          client_id                  = ad.value.client_id # Required
          allowed_audiences          = ad.value.allowed_audiences
          client_secret              = ad.value.client_secret # wrap the input into the sensitive() function.
          client_secret_setting_name = ad.value.client_secret_setting_name
        }
      }
      dynamic "facebook" {
        iterator = fb
        for_each = as.value.facebook

        content {
          app_id                  = fb.value.app_id     # Required
          app_secret              = fb.value.app_secret # wrap the input into the sensitive() function.
          app_secret_setting_name = fb.value.app_secret_setting_name
          oauth_scopes            = fb.value.oauth_scopes
        }
      }
      dynamic "github" {
        iterator = git
        for_each = as.value.github

        content {
          client_id                  = git.value.client_id     # Required
          client_secret              = git.value.client_secret # wrap the input into the sensitive() function.
          client_secret_setting_name = git.value.client_secret_setting_name
          oauth_scopes               = git.value.oauth_scopes
        }
      }
      dynamic "google" {
        iterator = g
        for_each = as.value.google

        content {
          client_id                  = g.value.client_id     # Required
          client_secret              = g.value.client_secret # wrap the input into the sensitive() function.
          client_secret_setting_name = g.value.client_secret_setting_name
          oauth_scopes               = g.value.oauth_scopes
        }
      }
      dynamic "microsoft" {
        iterator = ms
        for_each = as.value.microsoft

        content {
          client_id                  = ms.value.client_id     # Required
          client_secret              = ms.value.client_secret # wrap the input into the sensitive() function.
          client_secret_setting_name = ms.value.client_secret_setting_name
          oauth_scopes               = ms.value.oauth_scopes
        }
      }
      dynamic "twitter" {
        iterator = tw
        for_each = as.value.twitter

        content {
          consumer_key                 = tw.value.consumer_key    # Required
          consumer_secret              = tw.value.consumer_secret # wrap the input into the sensitive() function.
          consumer_secret_setting_name = tw.value.consumer_secret_setting_name
        }
      }
    }
  }

  dynamic "auth_settings_v2" {
    iterator = as2
    for_each = each.value.auth_settings_v2

    content {
      auth_enabled                            = as2.value.auth_enabled
      runtime_version                         = as2.value.runtime_version
      config_file_path                        = as2.value.config_file_path
      require_authentication                  = as2.value.require_authentication
      unauthenticated_action                  = as2.value.unauthenticated_action
      default_provider                        = as2.value.default_provider
      excluded_paths                          = as2.value.excluded_paths
      require_https                           = as2.value.require_https
      http_route_api_prefix                   = as2.value.http_route_api_prefix
      forward_proxy_convention                = as2.value.forward_proxy_convention
      forward_proxy_custom_host_header_name   = as2.value.forward_proxy_custom_host_header_name
      forward_proxy_custom_scheme_header_name = as2.value.forward_proxy_custom_scheme_header_name
      dynamic "apple_v2" {
        iterator = apv2
        for_each = as2.value.apple_v2

        content {
          client_id                  = apv2.value.client_id                  # Required
          client_secret_setting_name = apv2.value.client_secret_setting_name # Required
          login_scopes               = apv2.value.login_scopes
        }
      }
      dynamic "active_directory_v2" {
        iterator = adv2
        for_each = as2.value.active_directory_v2

        content {
          client_id                            = adv2.value.client_id            # Required
          tenant_auth_endpoint                 = adv2.value.tenant_auth_endpoint # Required
          client_secret_setting_name           = adv2.value.client_secret_setting_name
          client_secret_certificate_thumbprint = adv2.value.client_secret_certificate_thumbprint
          jwt_allowed_groups                   = adv2.value.jwt_allowed_groups
          jwt_allowed_client_applications      = adv2.value.jwt_allowed_client_applications
          www_authentication_disabled          = adv2.value.www_authentication_disabled
          allowed_groups                       = adv2.value.allowed_groups
          allowed_identities                   = adv2.value.allowed_identities
          allowed_applications                 = adv2.value.allowed_applications
          login_parameters                     = adv2.value.login_parameters
          allowed_audiences                    = adv2.value.allowed_audiences
        }
      }
      dynamic "azure_static_web_app_v2" {
        iterator = aswav2
        for_each = as2.value.azure_static_web_app_v2

        content {
          client_id = aswav2.value.client_id # Required
        }
      }
      dynamic "custom_oidc_v2" {
        iterator = cov2
        for_each = as2.value.custom_oidc_v2

        content {
          name                          = cov2.value.name                          # Required
          client_id                     = cov2.value.client_id                     # Required
          openid_configuration_endpoint = cov2.value.openid_configuration_endpoint # Required
          name_claim_type               = cov2.value.name_claim_type
          scopes                        = cov2.value.scopes
          client_credential_method      = cov2.value.client_credential_method
          client_secret_setting_name    = cov2.value.client_secret_setting_name
          authorisation_endpoint        = cov2.value.authorisation_endpoint
          token_endpoint                = cov2.value.token_endpoint
          issuer_endpoint               = cov2.value.issuer_endpoint
          certification_uri             = cov2.value.certification_uri
        }
      }
      dynamic "facebook_v2" {
        iterator = fbv2
        for_each = as2.value.facebook_v2

        content {
          app_id                  = fbv2.value.app_id                  # Required
          app_secret_setting_name = fbv2.value.app_secret_setting_name # Required
          graph_api_version       = fbv2.value.graph_api_version
          login_scopes            = fbv2.value.login_scopes
        }
      }
      dynamic "github_v2" {
        iterator = ghv2
        for_each = as2.value.github_v2

        content {
          client_id                  = ghv2.value.client_id                  # Required
          client_secret_setting_name = ghv2.value.client_secret_setting_name # Required
          login_scopes               = ghv2.value.login_scopes
        }
      }
      dynamic "google_v2" {
        iterator = gv2
        for_each = as2.value.google_v2

        content {
          client_id                  = gv2.value.client_id                  # Required
          client_secret_setting_name = gv2.value.client_secret_setting_name # Required
          allowed_audiences          = gv2.value.allowed_audiences
          login_scopes               = gv2.value.login_scopes
        }
      }
      dynamic "microsoft_v2" {
        iterator = msv2
        for_each = as2.value.microsoft_v2

        content {
          client_id                  = msv2.value.client_id                  # Required
          client_secret_setting_name = msv2.value.client_secret_setting_name # Required
          allowed_audiences          = msv2.value.allowed_audiences
          login_scopes               = msv2.value.login_scopes
        }
      }
      dynamic "twitter_v2" {
        iterator = tv2
        for_each = as2.value.twitter_v2

        content {
          consumer_key                 = tv2.value.consumer_key                 # Required
          consumer_secret_setting_name = tv2.value.consumer_secret_setting_name # Required
        }
      }
      dynamic "login" { # Required
        iterator = l
        for_each = as2.value.login

        content {
          logout_endpoint                   = l.value.logout_endpoint
          token_store_enabled               = l.value.token_store_enabled
          token_refresh_extension_time      = l.value.token_refresh_extension_time
          token_store_path                  = l.value.token_store_path
          token_store_sas_setting_name      = l.value.token_store_sas_setting_name
          preserve_url_fragments_for_logins = l.value.preserve_url_fragments_for_logins
          allowed_external_redirect_urls    = l.value.allowed_external_redirect_urls
          cookie_expiration_time            = l.value.cookie_expiration_time
          validate_nonce                    = l.value.validate_nonce
          nonce_expiration_time             = l.value.nonce_expiration_time
        }
      }
    }
  }

  dynamic "backup" {
    iterator = b
    for_each = each.value.backup

    content {
      name                = b.value.name                # Required
      storage_account_url = b.value.storage_account_url # Required, wrap the input into the sensitive() function.
      enabled             = b.value.enabled
      dynamic "schedule" { # Required
        iterator = sch
        for_each = b.value.schedule

        content {
          frequency_interval       = sch.value.frequency_interval # Required
          frequency_unit           = sch.value.frequency_unit     # Required
          keep_at_least_one_backup = sch.value.keep_at_least_one_backup
          retention_period_days    = sch.value.retention_period_days
          start_time               = sch.value.start_time
        }
      }
    }
  }

  dynamic "connection_string" {
    iterator = cs
    for_each = each.value.connection_string

    content {
      name  = cs.value.name  # Required
      type  = cs.value.type  # Required
      value = cs.value.value # Required, wrap the input into the sensitive() function.
    }
  }

  dynamic "identity" {
    iterator = i
    for_each = each.value.identity

    content {
      type         = i.value.type # Required
      identity_ids = i.value.identity_ids
    }
  }

  dynamic "storage_account" {
    iterator = sa
    for_each = each.value.storage_account

    content {
      access_key   = sa.value.access_key   # Required, wrap the input into the sensitive() function.
      account_name = sa.value.account_name # Required
      name         = sa.value.name         # Required
      share_name   = sa.value.share_name   # Required
      type         = sa.value.type         # Required
      mount_path   = sa.value.mount_path
    }
  }

  dynamic "sticky_settings" {
    iterator = ss
    for_each = each.value.sticky_settings

    content {
      app_setting_names       = ss.value.app_setting_names
      connection_string_names = ss.value.connection_string_names
    }
  }
}