[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
resource "azurerm_application_insights" "this" {

  for_each = var.azurerm_application_insights_params

  name                          = each.value.name                             # required
  resource_group_name           = each.value.resource_group_name              # required
  location                      = each.value.location                         # required
  application_type              = each.value.application_type                 # required
  workspace_id                  = each.value.workspace_id
  retention_in_days             = each.value.retention_in_days
  sampling_percentage           = each.value.sampling_percentage
  disable_ip_masking            = each.value.disable_ip_masking
  local_authentication_disabled = each.value.local_authentication_disabled
  tags                          = each.value.tags
}

```

## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5  |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                              | Type     |
|-----------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |

## Inputs

| Name                                                                                                                                    | Description | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Default | Required |
|-----------------------------------------------------------------------------------------------------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_azurerm_application_insights_params"></a> [azurerm\_application\_insights\_params](#input\_azurerm\_application\_insights\_params) | Object map for Azure application insights module input parameters         | <pre>map(object({<br>    name                                  = string      # required<br>    location                              = string      # required<br>    resource_group_name                   = string      # required<br>    application_type                      = string      # required<br>    workspace_id                          = string      <br>    daily_data_cap_in_gb                  = number      <br>    retention_in_days                     = number      <br>    sampling_percentage                   = number      <br>    disable_ip_masking                    = bool        <br>    local_authentication_disabled         = bool        <br>    daily_data_cap_notifications_disabled = bool        <br>    internet_ingestion_enabled            = bool        <br>    internet_query_enabled                = bool        <br>    force_customer_storage_for_profiler   = bool        <br>    tags                                  = map(string)<br>  }))</pre> | n/a     |   yes    |


## Outputs

|Name                                                                                                      | Description |
|-----------------------------------------------------------------------------------------------------------|-------------|
| <a name="output_application_insights"></a> [application\_insights](#output\_application\_insights) | An object containing data created by the insights application module.|

[//]: # (END_TF_DOCS)
