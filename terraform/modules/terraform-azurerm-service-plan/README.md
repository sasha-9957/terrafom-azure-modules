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
| [azurerm_service_plan.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_service_plan_params"></a> [azurerm\_service\_plan\_params](#input\_azurerm\_service\_plan\_params) | Object map for Azure Service Plan module input parameters. | <pre>map(object({<br>    name                         = string # Required<br>    location                     = string # Required<br>    os_type                      = string # Required<br>    resource_group_name          = string # Required<br>    sku_name                     = string # Required<br>    app_service_environment_id   = string<br>    maximum_elastic_worker_count = number<br>    worker_count                 = number<br>    per_site_scaling_enabled     = bool<br>    zone_balancing_enabled       = bool<br>    tags                         = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_plans"></a> [service\_plans](#output\_service\_plans) | An object containing data created by the Azure Service Plan module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->