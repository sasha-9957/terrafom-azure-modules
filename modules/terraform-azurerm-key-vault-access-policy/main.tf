resource "azurerm_key_vault_access_policy" "this" {
  for_each = var.azurerm_key_vault_access_policy_params

  key_vault_id            = each.value.key_vault_id # Required
  tenant_id               = each.value.tenant_id    # Required
  object_id               = each.value.object_id    # Required
  application_id          = each.value.application_id
  certificate_permissions = each.value.certificate_permissions
  key_permissions         = each.value.key_permissions
  secret_permissions      = each.value.secret_permissions
  storage_permissions     = each.value.storage_permissions
}
