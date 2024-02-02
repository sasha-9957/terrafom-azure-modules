module "key_vault_access_policy" {

  source = "../modules/terraform-azurerm-key-vault-access-policy"

  azurerm_key_vault_access_policy_params = {
    key_vault_access_policy = {
      key_vault_id            = azurerm_key_vault.test.id
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["List", "Get", "Create", "Delete"]
      secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
      application_id          = null
      certificate_permissions = ["List", "Get", "Create", "Delete"]
      storage_permissions     = null
    }
  }
}
