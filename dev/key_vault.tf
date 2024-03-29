data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "../modules/terraform-azurerm-key-vault"

  azurerm_key_vault_params = {
    key_vault1 = {
      name                            = module.name.names["key_vault1"].result                    # required
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
      tags                            = module.tags.tags
      access_policy                   = []
      network_acls                    = []
      contact                         = []
    }
  }
}

module "key_vault_access_policy" {
  source = "../modules/terraform-azurerm-key-vault-access-policy"

  azurerm_key_vault_access_policy_params = {
    key_vault_access_policy1 = {
      key_vault_id            = module.key_vault.key_vaults["key_vault1"].id # Required
      tenant_id               = data.azurerm_client_config.current.tenant_id # Required
      object_id               = data.azurerm_client_config.current.object_id # Required
      application_id          = null
      certificate_permissions = null
      key_permissions         = null
      secret_permissions      = ["Get", "List"]
      storage_permissions     = null
    }
  }
}

