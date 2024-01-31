resource "azurerm_application_insights" "this" {

  for_each = var.azurerm_application_insights_params

  name                          = each.value.name                # required
  resource_group_name           = each.value.resource_group_name # required
  location                      = each.value.location            # required
  application_type              = each.value.application_type    # required
  workspace_id                  = each.value.workspace_id
  retention_in_days             = each.value.retention_in_days
  sampling_percentage           = each.value.sampling_percentage
  disable_ip_masking            = each.value.disable_ip_masking
  local_authentication_disabled = each.value.local_authentication_disabled
  tags                          = each.value.tags
}
