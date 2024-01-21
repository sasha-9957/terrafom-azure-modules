module "storage_account" {
  source = "app.terraform.io/captionhealth/storage-account/azurerm"

  azurerm_storage_account_params = {
    test_storage_account = {
      name                              = "hhcompsa"  # required
      resource_group_name               = "hhcomprg"  # required
      location                          = "centralus" # required
      account_kind                      = null
      account_tier                      = "Standard" # required
      account_replication_type          = "LRS"      # required
      cross_tenant_replication_enabled  = null
      access_tier                       = null
      edge_zone                         = null
      enable_https_traffic_only         = null
      min_tls_version                   = null
      allow_nested_items_to_be_public   = null
      shared_access_key_enabled         = null
      public_network_access_enabled     = null
      default_to_oauth_authentication   = null
      is_hns_enabled                    = null
      nfsv3_enabled                     = null
      large_file_share_enabled          = null
      queue_encryption_key_type         = null
      table_encryption_key_type         = null
      infrastructure_encryption_enabled = null
      allowed_copy_scope                = null
      sftp_enabled                      = null
      tags                              = null
    }
  }
}
