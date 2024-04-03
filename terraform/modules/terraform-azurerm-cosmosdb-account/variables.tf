variable "azurerm_cosmosdb_account_params" {
  description = "Object map for Azure Resource CosmosDB Account module input parameters."
  type = map(object({
    name                                  = string # Required
    resource_group_name                   = string # Required
    location                              = string # Required
    tags                                  = map(string)
    minimal_tls_version                   = string
    offer_type                            = string # Required
    create_mode                           = string
    default_identity_type                 = string
    kind                                  = string
    ip_range_filter                       = string
    enable_free_tier                      = bool
    analytical_storage_enabled            = bool
    enable_automatic_failover             = bool
    partition_merge_enabled               = bool
    public_network_access_enabled         = bool
    is_virtual_network_filter_enabled     = bool
    key_vault_key_id                      = string
    enable_multiple_write_locations       = bool
    access_key_metadata_writes_enabled    = bool
    mongo_server_version                  = string
    network_acl_bypass_for_azure_services = bool
    network_acl_bypass_ids                = list(string)
    local_authentication_disabled         = bool

    analytical_storage = list(object({
      schema_type = string # Required
    }))

    capacity = list(object({
      total_throughput_limit = number # Required
    }))

    consistency_policy = list(object({ # Required
      consistency_level       = string # Required
      max_interval_in_seconds = number
      max_staleness_prefix    = number
    }))

    geo_location = list(object({ # Required
      location          = string # Required
      failover_priority = number # Required
      zone_redundant    = bool
    }))

    capabilities = list(object({
      name = string # Required
    }))

    virtual_network_rule = list(object({
      id                                   = string # Required
      ignore_missing_vnet_service_endpoint = bool
    }))

    backup = list(object({
      type                = string # Required
      tier                = string
      interval_in_minutes = number
      retention_in_hours  = number
      storage_redundancy  = string
    }))

    cors_rule = list(object({
      allowed_headers    = list(string) # Required
      allowed_methods    = list(string) # Required
      allowed_origins    = list(string) # Required
      exposed_headers    = list(string) # Required
      max_age_in_seconds = number
    }))

    identity = list(object({
      type         = string # Required
      identity_ids = set(string)
    }))

    restore = list(object({
      source_cosmosdb_account_id = string # Required
      restore_timestamp_in_utc   = string # Required
      tables_to_restore          = list(string)
      database = list(object({
        name             = string # Required
        collection_names = set(string)
      }))
      gremlin_database = list(object({
        name        = string # Required
        graph_names = list(string)
      }))
    }))
  }))
}
