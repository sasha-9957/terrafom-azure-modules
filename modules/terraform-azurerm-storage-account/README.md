<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_account_params"></a> [azurerm\_storage\_account\_params](#input\_azurerm\_storage\_account\_params) | Object map for Azure Storage Account module input parameters. | <pre>map(object({<br>    name                              = string<br>    resource_group_name               = string<br>    location                          = string<br>    account_kind                      = string<br>    account_tier                      = string # required<br>    account_replication_type          = string # required<br>    cross_tenant_replication_enabled  = bool<br>    access_tier                       = string<br>    edge_zone                         = string<br>    enable_https_traffic_only         = bool<br>    min_tls_version                   = string<br>    allow_nested_items_to_be_public   = bool<br>    shared_access_key_enabled         = bool<br>    public_network_access_enabled     = bool<br>    default_to_oauth_authentication   = bool<br>    is_hns_enabled                    = bool<br>    nfsv3_enabled                     = bool<br>    large_file_share_enabled          = bool<br>    queue_encryption_key_type         = string<br>    table_encryption_key_type         = string<br>    infrastructure_encryption_enabled = bool<br>    allowed_copy_scope                = string<br>    sftp_enabled                      = bool<br>    tags                              = map(string)<br><br>    custom_domain = list(object({<br>      name          = string # required<br>      use_subdomain = bool<br>    }))<br><br>    customer_managed_key = list(object({<br>      key_vault_key_id          = string # required<br>      user_assigned_identity_id = string # required<br>    }))<br><br>    identity = list(object({<br>      type         = string<br>      identity_ids = set(string)<br>    }))<br><br>    blob_properties = list(object({<br>      cors_rule = list(object({<br>        allowed_headers    = list(string) # required<br>        allowed_methods    = list(string) # required<br>        allowed_origins    = list(string) # required<br>        exposed_headers    = list(string) # required<br>        max_age_in_seconds = number       # required<br>      }))<br>      delete_retention_policy = list(object({<br>        days = number<br>      }))<br>      restore_policy = list(object({<br>        days = number<br>      }))<br>    }))<br><br>    queue_properties = list(object({<br>      cors_rule = list(object({<br>        allowed_headers    = list(string) # required<br>        allowed_methods    = list(string) # required<br>        allowed_origins    = list(string) # required<br>        exposed_headers    = list(string) # required<br>        max_age_in_seconds = number       # required<br>      }))<br>      logging = list(object({<br>        delete                = bool   # required<br>        read                  = bool   # required<br>        version               = string # required<br>        write                 = bool   # required<br>        retention_policy_days = number<br>      }))<br>      minute_metrics = list(object({<br>        enabled               = bool   # required<br>        version               = string # required<br>        include_apis          = bool<br>        retention_policy_days = number<br>      }))<br>      hour_metrics = list(object({<br>        enabled               = bool   # required<br>        version               = string # required<br>        include_apis          = bool<br>        retention_policy_days = number<br>      }))<br>    }))<br><br>    static_website = list(object({<br>      index_document     = string<br>      error_404_document = string<br>    }))<br><br>    share_properties = list(object({<br>      cors_rule = list(object({<br>        allowed_headers    = list(string) # required<br>        allowed_methods    = list(string) # required<br>        allowed_origins    = list(string) # required<br>        exposed_headers    = list(string) # required<br>        max_age_in_seconds = number       # required<br>      }))<br>      retention_policy = list(object({<br>        days = number<br>      }))<br>      smb = list(object({<br>        versions                        = set(string)<br>        authentication_types            = set(string)<br>        kerberos_ticket_encryption_type = set(string)<br>        channel_encryption_type         = set(string)<br>        multichannel_enabled            = bool<br>      }))<br>    }))<br><br>    network_rules = list(object({<br>      default_action             = string # required<br>      bypass                     = string<br>      ip_rules                   = string<br>      virtual_network_subnet_ids = set(string)<br>      private_link_access = list(object({<br>        endpoint_resource_id = string # required<br>        endpoint_tenant_id   = string<br>      }))<br>    }))<br><br>    azure_files_authentication = list(object({<br>      directory_type = string # required<br>      active_directory = list(object({<br>        domain_name         = string # required<br>        domain_guid         = string # required<br>        domain_sid          = string<br>        storage_sid         = string<br>        forest_name         = string<br>        netbios_domain_name = string<br>      }))<br>    }))<br><br>    routing = list(object({<br>      publish_internet_endpoints  = bool<br>      publish_microsoft_endpoints = bool<br>      choice                      = string<br>    }))<br><br>    immutability_policy = list(object({<br>      allow_protected_append_writes = bool   # required<br>      state                         = string # required<br>      period_since_creation_in_days = number # required<br>    }))<br><br>    sas_policy = list(object({<br>      expiration_period = string # required<br>      expiration_action = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_accounts"></a> [storage\_accounts](#output\_storage\_accounts) | An object containing the Storage Accounts created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->