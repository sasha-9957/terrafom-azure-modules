module "cosmosdb_account" {
  source  = "app.terraform.io/captionhealth/cosmosdb-account/azurerm"
  version = "1.0.0"

  azurerm_cosmosdb_account_params = {
    main_cosmosdb_account = {
      name                                  = module.name.names["main_cosmosdb_account"]                # Required
      resource_group_name                   = module.resource_group.resource_groups["main_rg"].name     # Required
      location                              = module.resource_group.resource_groups["main_rg"].location # Required
      tags                                  = module.tags.tags
      minimal_tls_version                   = null
      offer_type                            = "Standard" # Required
      create_mode                           = null
      default_identity_type                 = null
      kind                                  = null
      ip_range_filter                       = null
      enable_free_tier                      = null
      analytical_storage_enabled            = null
      enable_automatic_failover             = null
      partition_merge_enabled               = null
      public_network_access_enabled         = null
      is_virtual_network_filter_enabled     = null
      key_vault_key_id                      = null
      enable_multiple_write_locations       = null
      access_key_metadata_writes_enabled    = null
      mongo_server_version                  = "4.2"
      network_acl_bypass_for_azure_services = true
      network_acl_bypass_ids                = null
      local_authentication_disabled         = null

      analytical_storage = [
        # {
        #   schema_type = "FullFidelity" # Required
        # }
      ]

      capacity = [
        # {
        #   total_throughput_limit = -1 # Required
        # }
      ]

      consistency_policy = [ # Required
        {
          consistency_level       = "BoundedStaleness" # Required
          max_interval_in_seconds = 300
          max_staleness_prefix    = 100000
        }
      ]

      geo_location = [ # Required
        {
          location          = "eastus" # Required
          failover_priority = 0        # Required
          zone_redundant    = null
        }
      ]

      capabilities = [
        # {
        #   name = "EnableAggregationPipeline" # Required
        # }
      ]
      capabilities = [
        # {
        #   name = "mongoEnableDocLevelTTL" # Required
        # }
      ]
      capabilities = [
        # {
        #   name = "MongoDBv3.4" # Required
        # }
      ]
      capabilities = [
        # {
        #   name = "EnableMongo" # Required
        # }
      ]

      virtual_network_rule = [
        # {
        #   id                                   = module.subnet.subnets["subnet1"].id # Required
        #   ignore_missing_vnet_service_endpoint = null
        # }
      ]

      backup = [
        # {
        #   type                = "Continuous" # Required
        #   tier                = "Continuous30Days"
        #   interval_in_minutes = null
        #   retention_in_hours  = null
        #   storage_redundancy  = null
        # }
      ]

      cors_rule = [
        # {
        #   allowed_headers = [
        #     "Host",
        #     "User-Agent",
        #     "Accept",
        #     "Accept-Language",
        #     "Accept-Encoding",
        #     "Referer",
        #     "Connection"
        #   ]                                      # Required
        #   allowed_methods = ["GET", "POST"]      # Required
        #   allowed_origins = ["portal.azure.com"] # Required
        #   exposed_headers = [
        #     "Host",
        #     "User-Agent",
        #     "Accept",
        #     "Accept-Language",
        #     "Accept-Encoding",
        #     "Referer",
        #     "Connection"
        #   ] # Required
        #   max_age_in_seconds = null
        # }
      ]

      identity = [
        # {
        #   type         = "SystemAssigned" # Required
        #   identity_ids = null
        # }
      ]

      restore = [
        # {
        #   source_cosmosdb_account_id = "/subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/locations/{location}/restorableDatabaseAccounts/{restorableDatabaseAccountName}" # Required
        #   restore_timestamp_in_utc   = "2024-03-11T15:30:00Z"                                                                                                                           # Required
        #   tables_to_restore          = null
        #   database = [
        #     {
        #       name             = "myDb" # Required
        #       collection_names = null
        #     }
        #   ]
        #   gremlin_database = [
        #     {
        #       name        = "myGremlinDb" # Required
        #       graph_names = null
        #     }
        #   ]
        # }
      ]
    }
  }
}
