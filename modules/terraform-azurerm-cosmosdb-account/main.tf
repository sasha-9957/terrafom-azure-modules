resource "azurerm_cosmosdb_account" "this" {
  for_each = var.azurerm_cosmosdb_account_params

  name                                  = each.value.name                # Required
  resource_group_name                   = each.value.resource_group_name # Required
  location                              = each.value.location            # Required
  tags                                  = each.value.tags
  minimal_tls_version                   = each.value.minimal_tls_version
  offer_type                            = each.value.offer_type # Required
  create_mode                           = each.value.create_mode
  default_identity_type                 = each.value.default_identity_type
  kind                                  = each.value.kind
  ip_range_filter                       = each.value.ip_range_filter
  enable_free_tier                      = each.value.enable_free_tier
  analytical_storage_enabled            = each.value.analytical_storage_enabled
  enable_automatic_failover             = each.value.enable_automatic_failover
  partition_merge_enabled               = each.value.partition_merge_enabled
  public_network_access_enabled         = each.value.public_network_access_enabled
  is_virtual_network_filter_enabled     = each.value.is_virtual_network_filter_enabled
  key_vault_key_id                      = each.value.key_vault_key_id
  enable_multiple_write_locations       = each.value.enable_multiple_write_locations
  access_key_metadata_writes_enabled    = each.value.access_key_metadata_writes_enabled
  mongo_server_version                  = each.value.mongo_server_version
  network_acl_bypass_for_azure_services = each.value.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = each.value.network_acl_bypass_ids
  local_authentication_disabled         = each.value.local_authentication_disabled

  dynamic "analytical_storage" {
    iterator = as
    for_each = each.value.analytical_storage

    content {
      schema_type = as.value.schema_type # Required
    }
  }
  dynamic "capacity" {
    iterator = cy
    for_each = each.value.capacity

    content {
      total_throughput_limit = cy.value.total_throughput_limit # Required
    }
  }
  dynamic "consistency_policy" { # Required
    iterator = cp
    for_each = each.value.consistency_policy

    content {
      consistency_level       = cp.value.consistency_level # Required
      max_interval_in_seconds = cp.value.max_interval_in_seconds
      max_staleness_prefix    = cp.value.max_staleness_prefix
    }
  }
  dynamic "geo_location" { # Required
    iterator = gl
    for_each = each.value.geo_location

    content {
      location          = gl.value.location          # Required
      failover_priority = gl.value.failover_priority # Required
      zone_redundant    = gl.value.zone_redundant
    }
  }
  dynamic "capabilities" {
    iterator = cs
    for_each = each.value.capabilities

    content {
      name = cs.value.name # Required
    }
  }
  dynamic "virtual_network_rule" {
    iterator = vnr
    for_each = each.value.virtual_network_rule

    content {
      id                                   = vnr.value.id # Required
      ignore_missing_vnet_service_endpoint = vnr.value.ignore_missing_vnet_service_endpoint
    }
  }
  dynamic "backup" {
    iterator = b
    for_each = each.value.backup

    content {
      type                = b.value.type # Required
      tier                = b.value.tier
      interval_in_minutes = b.value.interval_in_minutes
      retention_in_hours  = b.value.retention_in_hours
      storage_redundancy  = b.value.storage_redundancy
    }
  }
  dynamic "cors_rule" {
    iterator = cr
    for_each = each.value.cors_rule

    content {
      allowed_headers    = cr.value.allowed_headers # Required
      allowed_methods    = cr.value.allowed_methods # Required
      allowed_origins    = cr.value.allowed_origins # Required
      exposed_headers    = cr.value.exposed_headers # Required
      max_age_in_seconds = cr.value.max_age_in_seconds
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
  dynamic "restore" {
    iterator = r
    for_each = each.value.restore

    content {
      source_cosmosdb_account_id = r.value.source_cosmosdb_account_id # Required
      restore_timestamp_in_utc   = r.value.restore_timestamp_in_utc   # Required
      tables_to_restore          = r.value.tables_to_restore

      dynamic "database" {
        iterator = d
        for_each = r.value.database

        content {
          name             = d.value.name # Required
          collection_names = d.value.collection_names
        }
      }
      dynamic "gremlin_database" {
        iterator = gd
        for_each = r.value.gremlin_database

        content {
          name        = gd.value.name # Required
          graph_names = gd.value.graph_names
        }
      }
    }
  }
}
