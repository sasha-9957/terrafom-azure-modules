resource "azurerm_role_definition" "this" {
  for_each = var.azurerm_role_definition_params

  role_definition_id = each.value.role_definition_id
  name               = each.value.name  # Required
  scope              = each.value.scope # Required
  description        = each.value.description
  assignable_scopes  = each.value.assignable_scopes

  dynamic "permissions" {
    iterator = p
    for_each = each.value.permissions

    content {
      actions          = p.value.actions
      data_actions     = p.value.data_actions
      not_actions      = p.value.not_actions
      not_data_actions = p.value.not_data_actions
    }
  }
}
