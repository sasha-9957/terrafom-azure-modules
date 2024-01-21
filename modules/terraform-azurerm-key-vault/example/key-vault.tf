module "key_vault" {
  source = "app.terraform.io/captionhealth/key-vault/azurerm"

  azurerm_key_vault_params = {
    main_key_vault = {
      name                            = each.value.name                # required
      location                        = each.value.location            # required
      resource_group_name             = each.value.resource_group_name # required
      sku_name                        = each.value.sku_name            # required
      tenant_id                       = each.value.tenant_id           # required
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
