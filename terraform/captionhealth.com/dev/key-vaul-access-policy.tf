module "key_vault_access_policy" {
  source = "../../modules/terraform-azurerm-key-vault-access-policy"

  azurerm_key_vault_access_policy_params = {
    dwh_key_vault_access_policy = {
      key_vault_id            = module.key_vault.key_vaults["dwh_key_vault"].id # Required
      tenant_id               = data.azurerm_client_config.current.tenant_id    # Required
      object_id               = data.azurerm_client_config.current.object_id    # Required
      application_id          = null
      certificate_permissions = null
      key_permissions         = null
      secret_permissions      = ["Get", "List"]
      storage_permissions     = null
    }
  }
}
