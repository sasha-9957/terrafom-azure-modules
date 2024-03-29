data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "../../modules/terraform-azurerm-key-vault"

  azurerm_key_vault_params = {
    dwh_key_vault = {
      name                            = module.name.names["dwh_key_vault"].result                 # required
      location                        = module.resource_group.resource_groups["dwh_rg"].location  # required
      resource_group_name             = module.resource_group.resource_groups["dwh_rg"].name      # required
      sku_name                        = "standard"                                                # required
      tenant_id                       = data.azurerm_client_config.current.tenant_id              # required
      enabled_for_deployment          = null
      enabled_for_disk_encryption     = null
      enabled_for_template_deployment = null
      enable_rbac_authorization       = null
      purge_protection_enabled        = null
      public_network_access_enabled   = null
      soft_delete_retention_days      = null
      tags                            = module.tags.tags
      access_policy                   = []
      network_acls                    = []
      contact                         = []
    }
  }
}