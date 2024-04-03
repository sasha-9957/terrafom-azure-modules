<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_log_analytics_workspace_params"></a> [azurerm\_log\_analytics\_workspace\_params](#input\_azurerm\_log\_analytics\_workspace\_params) | Object map for Azure Log Analytics Workspace module input parameters. | <pre>map(object({<br>    name                                    = string # Required<br>    resource_group_name                     = string # Required<br>    location                                = string # Required<br>    allow_resource_only_permissions         = bool<br>    local_authentication_disabled           = bool<br>    sku                                     = string<br>    retention_in_days                       = number<br>    daily_quota_gb                          = number<br>    cmk_for_query_forced                    = bool<br>    internet_ingestion_enabled              = bool<br>    internet_query_enabled                  = bool<br>    reservation_capacity_in_gb_per_day      = number # Can only be used when the sku is set to CapacityReservation<br>    data_collection_rule_id                 = string<br>    immediate_data_purge_on_30_days_enabled = bool<br>    tags                                    = map(string)<br><br>    identity = list(object({<br>      type         = string      # Required<br>      identity_ids = set(string) # Required if type is UserAssigned.<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_log_analytics_workspaces"></a> [azurerm\_log\_analytics\_workspaces](#output\_azurerm\_log\_analytics\_workspaces) | An object containing the Azure Log Analytics Workspaces created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->