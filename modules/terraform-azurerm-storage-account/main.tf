resource "azurerm_storage_account" "this" {
  for_each = var.azurerm_storage_account_params

  name                              = each.value.name                # required
  resource_group_name               = each.value.resource_group_name # required
  location                          = each.value.location            # required
  account_kind                      = each.value.account_kind
  account_tier                      = each.value.account_tier             # required
  account_replication_type          = each.value.account_replication_type # required
  cross_tenant_replication_enabled  = each.value.cross_tenant_replication_enabled
  access_tier                       = each.value.access_tier
  edge_zone                         = each.value.edge_zone
  enable_https_traffic_only         = each.value.enable_https_traffic_only
  min_tls_version                   = each.value.min_tls_version
  allow_nested_items_to_be_public   = each.value.allow_nested_items_to_be_public
  shared_access_key_enabled         = each.value.shared_access_key_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication
  is_hns_enabled                    = each.value.is_hns_enabled
  nfsv3_enabled                     = each.value.nfsv3_enabled
  large_file_share_enabled          = each.value.large_file_share_enabled
  queue_encryption_key_type         = each.value.queue_encryption_key_type
  table_encryption_key_type         = each.value.table_encryption_key_type
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
  allowed_copy_scope                = each.value.allowed_copy_scope
  sftp_enabled                      = each.value.sftp_enabled
  tags                              = each.value.tags

  dynamic "custom_domain" {
    iterator = cd
    for_each = each.value.custom_domain

    content {
      name          = cd.value.name # required
      use_subdomain = cd.value.use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    iterator = cmk
    for_each = each.value.customer_managed_key

    content {
      key_vault_key_id          = cmk.value.key_vault_key_id          # required
      user_assigned_identity_id = cmk.value.user_assigned_identity_id # required
    }
  }

  dynamic "identity" {
    iterator = identity
    for_each = each.value.identity

    content {
      type         = identity.value.type # required
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "blob_properties" {
    iterator = bp
    for_each = each.value.blob_properties

    content {
      dynamic "cors_rule" {
        iterator = cors
        for_each = each.value.cors_rule

        content {
          allowed_headers    = cors.value.allowed_headers    # required
          allowed_methods    = cors.value.allowed_methods    # required
          allowed_origins    = cors.value.allowed_origins    # required
          exposed_headers    = cors.value.exposed_headers    # required
          max_age_in_seconds = cors.value.max_age_in_seconds # required
        }
      }

      dynamic "delete_retention_policy" {
        iterator = drp
        for_each = each.value.drp

        content {
          days = drp.value.days
        }
      }

      dynamic "restore_policy" {
        iterator = rp
        for_each = each.value.rp

        content {
          days = rp.value.days
        }
      }
    }
  }

  dynamic "queue_properties" {
    iterator = qp
    for_each = each.value.queue_properties

    content {
      dynamic "cors_rule" {
        iterator = cors
        for_each = each.value.cors_rule

        content {
          allowed_headers    = cors.value.allowed_headers    # required
          allowed_methods    = cors.value.allowed_methods    # required
          allowed_origins    = cors.value.allowed_origins    # required
          exposed_headers    = cors.value.exposed_headers    # required
          max_age_in_seconds = cors.value.max_age_in_seconds # required
        }
      }
      dynamic "logging" {
        iterator = log
        for_each = each.value.logging

        content {
          delete                = log.value.delete  # required
          read                  = log.value.read    # required
          version               = log.value.version # required
          write                 = log.value.write   # required
          retention_policy_days = log.value.retention_policy_days
        }
      }
      dynamic "minute_metrics" {
        iterator = mm
        for_each = each.value.minute_metrics

        content {
          enabled               = mm.value.enabled # required
          version               = mm.value.version # required
          include_apis          = mm.value.include_apis
          retention_policy_days = mm.value.retention_policy_days
        }
      }
      dynamic "hour_metrics" {
        iterator = hm
        for_each = each.value.hour_metrics

        content {
          enabled               = hm.value.enabled # required
          version               = hm.value.version # required
          include_apis          = hm.value.include_apis
          retention_policy_days = hm.value.retention_policy_days
        }
      }
    }
  }

  dynamic "static_website" {
    iterator = sw
    for_each = each.value.static_website

    content {
      index_document     = sw.value.index_document
      error_404_document = sw.value.error_404_document
    }
  }

  dynamic "share_properties" {
    iterator = sp
    for_each = each.value.share_properties

    content {
      dynamic "cors_rule" {
        iterator = cors
        for_each = each.value.cors_rule

        content {
          allowed_headers    = cors.value.allowed_headers    # required
          allowed_methods    = cors.value.allowed_methods    # required
          allowed_origins    = cors.value.allowed_origins    # required
          exposed_headers    = cors.value.exposed_headers    # required
          max_age_in_seconds = cors.value.max_age_in_seconds # required
        }
      }
      dynamic "retention_policy" {
        iterator = rtp
        for_each = each.value.drp

        content {
          days = rtp.value.days
        }
      }
      dynamic "smb" {
        iterator = smb
        for_each = each.value.smb

        content {
          versions                        = smb.value.versions
          authentication_types            = smb.value.authentication_types
          kerberos_ticket_encryption_type = smb.value.kerberos_ticket_encryption_type
          channel_encryption_type         = smb.value.channel_encryption_type
          multichannel_enabled            = smb.value.multichannel_enabled
        }
      }
    }
  }

  dynamic "network_rules" {
    iterator = nr
    for_each = each.value.network_rules

    content {
      default_action             = nr.value.default_action # required
      bypass                     = nr.value.bypass
      ip_rules                   = nr.value.ip_rules
      virtual_network_subnet_ids = nr.value.virtual_network_subnet_ids
      dynamic "private_link_access" {
        iterator = pla
        for_each = each.value.private_link_access

        content {
          endpoint_resource_id = pla.value.endpoint_resource_id # required
          endpoint_tenant_id   = pla.value.endpoint_tenant_id
        }
      }
    }
  }

  dynamic "azure_files_authentication" {
    iterator = afa
    for_each = each.value.azure_files_authentication

    content {
      directory_type = afa.value.directory_type # required
      dynamic "active_directory" {
        iterator = ad
        for_each = each.value.active_directory

        content {
          domain_name         = ad.value.domain_name # required
          domain_guid         = ad.value.domain_guid # required
          domain_sid          = ad.value.domain_sid
          storage_sid         = ad.value.storage_sid
          forest_name         = ad.value.forest_name
          netbios_domain_name = ad.value.netbios_domain_name
        }
      }
    }
  }

  dynamic "routing" {
    iterator = r
    for_each = each.value.routing

    content {
      publish_internet_endpoints  = r.value.publish_internet_endpoints
      publish_microsoft_endpoints = r.value.publish_microsoft_endpoints
      choice                      = r.value.choice
    }
  }

  dynamic "immutability_policy" {
    iterator = ip
    for_each = each.value.immutability_policy

    content {
      allow_protected_append_writes = ip.value.allow_protected_append_writes # required
      state                         = ip.value.state                         # required
      period_since_creation_in_days = ip.value.period_since_creation_in_days # required
    }
  }

  dynamic "sas_policy" {
    iterator = sasp
    for_each = each.value.sas_policy

    content {
      expiration_period = sasp.value.expiration_period # required
      expiration_action = sasp.value.expiration_action
    }
  }
}
