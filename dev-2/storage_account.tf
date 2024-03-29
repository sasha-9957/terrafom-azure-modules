module "storage_account" {
  source = "../modules/terraform-azurerm-storage-account"
  for_each             = local.environments

  azurerm_storage_account_params = {
    storage_account1 = {
      name                              = module.name.names["storage_account1"].result
      resource_group_name               = module.resource_group.resource_groups["main_rg"].name
      location                          = module.resource_group.resource_groups["main_rg"].location
      account_kind                      = "StorageV2"
      account_tier                      = "Standard"
      account_replication_type          = "LRS"
      cross_tenant_replication_enabled  = null
      access_tier                       = null
      edge_zone                         = null
      enable_https_traffic_only         = true
      min_tls_version                   = null
      allow_nested_items_to_be_public   = null
      shared_access_key_enabled         = null
      public_network_access_enabled     = true
      default_to_oauth_authentication   = null
      is_hns_enabled                    = false
      nfsv3_enabled                     = null
      large_file_share_enabled          = null
      local_user_enabled                = null
      queue_encryption_key_type         = null
      table_encryption_key_type         = null
      infrastructure_encryption_enabled = null
      allowed_copy_scope                = null
      sftp_enabled                      = null
      tags                              = module.tags.tags

      custom_domain        = []
      customer_managed_key = []
      identity             = []
      blob_properties      = []
      queue_properties     = []
      static_website       = []
      share_properties     = []
      network_rules = [
        {
          default_action             = "Allow"
          bypass                     = ["AzureServices"]
          ip_rules                   = null
          virtual_network_subnet_ids = null
          private_link_access        = []
        }
      ]
      azure_files_authentication = []
      routing                    = []
      immutability_policy        = []
      sas_policy                 = []
    }
  }
}

module "storage_container" {
  source = "../modules/terraform-azurerm-storage-container"

  azurerm_storage_container_params = {
    storage_container = {
      name                  = module.name.names["storage_container"].result                    # required
      storage_account_name  = module.storage_account.storage_accounts["storage_account1"].name # required
      container_access_type = null
      metadata              = null
    }
  }
}
