[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "application_insights" {
  source = "app.terraform.io/captionhealth/application-insights/azurerm"

  azurerm_application_insights_params = {
    application_insights = {
      name                                  = "app-insights-name"                                   # required
      location                              = local.location                                        # required
      resource_group_name                   = module.resource_group.resource_groups["main_rg"].name # required
      application_type                      = "web"                                                 # required
      workspace_id                          = null
      retention_in_days                     = null
      sampling_percentage                   = null
      disable_ip_masking                    = null
      daily_data_cap_in_gb                  = null
      local_authentication_disabled         = null
      daily_data_cap_notifications_disabled = null
      internet_ingestion_enabled            = null
      internet_query_enabled                = null
      force_customer_storage_for_profiler   = null
      tags                                  = module.tags.tags
    }
  }
}
```



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_application_insights_params"></a> [azurerm\_application\_insights\_params](#input\_azurerm\_application\_insights\_params) | Object map for Azure application insights module input parameters. | <pre>map(object({<br>    name                                  = string # required<br>    location                              = string # required<br>    resource_group_name                   = string # required<br>    application_type                      = string # required<br>    workspace_id                          = string<br>    daily_data_cap_in_gb                  = number<br>    retention_in_days                     = number<br>    sampling_percentage                   = number<br>    disable_ip_masking                    = bool<br>    local_authentication_disabled         = bool<br>    daily_data_cap_notifications_disabled = bool<br>    internet_ingestion_enabled            = bool<br>    internet_query_enabled                = bool<br>    force_customer_storage_for_profiler   = bool<br>    tags                                  = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_insights"></a> [application\_insights](#output\_application\_insights) | An object containing data created by the insights application module. |

[//]: # (END_TF_DOCS)