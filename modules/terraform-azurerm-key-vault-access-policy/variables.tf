variable "azurerm_key_vault_access_policy_params" {
  description = "Object map for Azure Key Vault Access Policy module input parameters."

  type = map(object({
    key_vault_id            = string
    tenant_id               = string
    object_id               = string
    application_id          = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
}