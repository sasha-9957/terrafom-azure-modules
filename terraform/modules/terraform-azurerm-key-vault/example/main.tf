data "azurerm_client_config" "current" {}

module "key_vault" {
  source  = "app.terraform.io/captionhealth/key-vault/azurerm"
  version = "1.0.0"

  azurerm_key_vault_params = {
    main_key_vault = {
      name                            = module.name.names["main_key_vault"].result                # required
      location                        = module.resource_group.resource_groups["main_rg"].location # required
      resource_group_name             = module.resource_group.resource_groups["main_rg"].name     # required
      sku_name                        = "standard"                                                # required
      tenant_id                       = data.azurerm_client_config.current.tenant_id              # required
      enabled_for_deployment          = null
      enabled_for_disk_encryption     = null
      enabled_for_template_deployment = null
      enable_rbac_authorization       = null
      purge_protection_enabled        = null
      public_network_access_enabled   = null
      soft_delete_retention_days      = null
      tags                            = null
    }
  }
}
