resource "azurerm_key_vault" "this" {
  for_each = var.azurerm_key_vault_params

  name                            = each.value.name                # required
  location                        = each.value.location            # required
  resource_group_name             = each.value.resource_group_name # required
  sku_name                        = each.value.sku_name            # required
  tenant_id                       = each.value.tenant_id           # required
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  enable_rbac_authorization       = each.value.enable_rbac_authorization
  purge_protection_enabled        = each.value.purge_protection_enabled
  public_network_access_enabled   = each.value.public_network_access_enabled
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  tags                            = each.value.tags

  dynamic "access_policy" {
    iterator = ap
    for_each = each.value.access_policy

    content {
      tenant_id               = ap.value.tenant_id # required
      object_id               = ap.value.object_id # required
      application_id          = ap.value.application_id
      certificate_permissions = ap.value.certificate_permissions
      key_permissions         = ap.value.key_permissions
      secret_permissions      = ap.value.secret_permissions
      storage_permissions     = ap.value.storage_permissions
    }

  }

  dynamic "network_acls" {
    iterator = na
    for_each = each.value.network_acls

    content {
      bypass                     = na.value.bypass         # required
      default_action             = na.value.default_action # required
      ip_rules                   = na.value.ip_rules
      virtual_network_subnet_ids = na.value.virtual_network_subnet_ids
    }

  }

  dynamic "contact" {
    iterator = c
    for_each = each.value.contact

    content {
      email = c.value.email # required
      name  = c.value.name
      phone = c.value.phone
    }

  }
}
