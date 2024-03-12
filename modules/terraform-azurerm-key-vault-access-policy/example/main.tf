data "azurerm_client_config" "current" {}

module "key_vault_access_policy" {
  source  = "app.terraform.io/captionhealth/key-vault-access-policy/azurerm"
  version = "1.0.0"

  azurerm_key_vault_access_policy_params = {
    key_vault_access_policy1 = {
      key_vault_id            = module.key_vault.key_vaults["main_key_vault"].id # Required
      tenant_id               = data.azurerm_client_config.current.tenant_id     # Required
      object_id               = data.azurerm_client_config.current.object_id     # Required
      application_id          = null
      certificate_permissions = null
      key_permissions         = ["Get", "List"]
      secret_permissions      = ["Get", "List"]
      storage_permissions     = null
    }
  }
}
