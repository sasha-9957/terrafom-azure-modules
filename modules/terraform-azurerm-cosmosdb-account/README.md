<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cosmosdb_account_params"></a> [azurerm\_cosmosdb\_account\_params](#input\_azurerm\_cosmosdb\_account\_params) | Object map for Azure Resource CosmosDB Account module input parameters. | <pre>map(object({<br>    name                                  = string # Required<br>    resource_group_name                   = string # Required<br>    location                              = string # Required<br>    tags                                  = map(string)<br>    minimal_tls_version                   = string<br>    offer_type                            = string # Required<br>    create_mode                           = string<br>    default_identity_type                 = string<br>    kind                                  = string<br>    ip_range_filter                       = string<br>    enable_free_tier                      = bool<br>    analytical_storage_enabled            = bool<br>    enable_automatic_failover             = bool<br>    partition_merge_enabled               = bool<br>    public_network_access_enabled         = bool<br>    is_virtual_network_filter_enabled     = bool<br>    key_vault_key_id                      = string<br>    enable_multiple_write_locations       = bool<br>    access_key_metadata_writes_enabled    = bool<br>    mongo_server_version                  = string<br>    network_acl_bypass_for_azure_services = bool<br>    network_acl_bypass_ids                = list(string)<br>    local_authentication_disabled         = bool<br><br>    analytical_storage = list(object({<br>      schema_type = string # Required<br>    }))<br><br>    capacity = list(object({<br>      total_throughput_limit = number # Required<br>    }))<br><br>    consistency_policy = list(object({ # Required<br>      consistency_level       = string # Required<br>      max_interval_in_seconds = number<br>      max_staleness_prefix    = number<br>    }))<br><br>    geo_location = list(object({ # Required<br>      location          = string # Required<br>      failover_priority = number # Required<br>      zone_redundant    = bool<br>    }))<br><br>    capabilities = list(object({<br>      name = string # Required<br>    }))<br><br>    virtual_network_rule = list(object({<br>      id                                   = string # Required<br>      ignore_missing_vnet_service_endpoint = bool<br>    }))<br><br>    backup = list(object({<br>      type                = string # Required<br>      tier                = string<br>      interval_in_minutes = number<br>      retention_in_hours  = number<br>      storage_redundancy  = string<br>    }))<br><br>    cors_rule = list(object({<br>      allowed_headers    = list(string) # Required<br>      allowed_methods    = list(string) # Required<br>      allowed_origins    = list(string) # Required<br>      exposed_headers    = list(string) # Required<br>      max_age_in_seconds = number<br>    }))<br><br>    identity = list(object({<br>      type         = string # Required<br>      identity_ids = set(string)<br>    }))<br><br>    restore = list(object({<br>      source_cosmosdb_account_id = string # Required<br>      restore_timestamp_in_utc   = string # Required<br>      tables_to_restore          = list(string)<br>      database = list(object({<br>        name             = string # Required<br>        collection_names = set(string)<br>      }))<br>      gremlin_database = list(object({<br>        name        = string # Required<br>        graph_names = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_accounts"></a> [cosmosdb\_accounts](#output\_cosmosdb\_accounts) | An object containing the Azure CosmosDB Accounts created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->