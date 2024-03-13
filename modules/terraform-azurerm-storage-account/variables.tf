variable "azurerm_storage_account_params" {
  description = "Object map for Azure Storage Account module input parameters."
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_kind                      = string
    account_tier                      = string # required
    account_replication_type          = string # required
    cross_tenant_replication_enabled  = bool
    access_tier                       = string
    edge_zone                         = string
    enable_https_traffic_only         = bool
    min_tls_version                   = string
    allow_nested_items_to_be_public   = bool
    shared_access_key_enabled         = bool
    public_network_access_enabled     = bool
    default_to_oauth_authentication   = bool
    is_hns_enabled                    = bool
    nfsv3_enabled                     = bool
    large_file_share_enabled          = bool
    local_user_enabled                = bool
    queue_encryption_key_type         = string
    table_encryption_key_type         = string
    infrastructure_encryption_enabled = bool
    allowed_copy_scope                = string
    sftp_enabled                      = bool
    tags                              = map(string)

    custom_domain = list(object({
      name          = string # required
      use_subdomain = bool
    }))

    customer_managed_key = list(object({
      key_vault_key_id          = string # required
      user_assigned_identity_id = string # required
    }))

    identity = list(object({
      type         = string
      identity_ids = set(string)
    }))

    blob_properties = list(object({
      cors_rule = list(object({
        allowed_headers    = list(string) # required
        allowed_methods    = list(string) # required
        allowed_origins    = list(string) # required
        exposed_headers    = list(string) # required
        max_age_in_seconds = number       # required
      }))
      delete_retention_policy = list(object({
        days = number
      }))
      restore_policy = list(object({
        days = number
      }))
    }))

    queue_properties = list(object({
      cors_rule = list(object({
        allowed_headers    = list(string) # required
        allowed_methods    = list(string) # required
        allowed_origins    = list(string) # required
        exposed_headers    = list(string) # required
        max_age_in_seconds = number       # required
      }))
      logging = list(object({
        delete                = bool   # required
        read                  = bool   # required
        version               = string # required
        write                 = bool   # required
        retention_policy_days = number
      }))
      minute_metrics = list(object({
        enabled               = bool   # required
        version               = string # required
        include_apis          = bool
        retention_policy_days = number
      }))
      hour_metrics = list(object({
        enabled               = bool   # required
        version               = string # required
        include_apis          = bool
        retention_policy_days = number
      }))
    }))

    static_website = list(object({
      index_document     = string
      error_404_document = string
    }))

    share_properties = list(object({
      cors_rule = list(object({
        allowed_headers    = list(string) # required
        allowed_methods    = list(string) # required
        allowed_origins    = list(string) # required
        exposed_headers    = list(string) # required
        max_age_in_seconds = number       # required
      }))
      retention_policy = list(object({
        days = number
      }))
      smb = list(object({
        versions                        = set(string)
        authentication_types            = set(string)
        kerberos_ticket_encryption_type = set(string)
        channel_encryption_type         = set(string)
        multichannel_enabled            = bool
      }))
    }))

    network_rules = list(object({
      default_action             = string # required
      bypass                     = string
      ip_rules                   = string
      virtual_network_subnet_ids = set(string)
      private_link_access = list(object({
        endpoint_resource_id = string # required
        endpoint_tenant_id   = string
      }))
    }))

    azure_files_authentication = list(object({
      directory_type = string # required
      active_directory = list(object({
        domain_name         = string # required
        domain_guid         = string # required
        domain_sid          = string
        storage_sid         = string
        forest_name         = string
        netbios_domain_name = string
      }))
    }))

    routing = list(object({
      publish_internet_endpoints  = bool
      publish_microsoft_endpoints = bool
      choice                      = string
    }))

    immutability_policy = list(object({
      allow_protected_append_writes = bool   # required
      state                         = string # required
      period_since_creation_in_days = number # required
    }))

    sas_policy = list(object({
      expiration_period = string # required
      expiration_action = string
    }))
  }))
}
