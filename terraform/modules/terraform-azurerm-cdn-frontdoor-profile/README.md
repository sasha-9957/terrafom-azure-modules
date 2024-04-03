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
| [azurerm_cdn_frontdoor_profile.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_profile_params"></a> [azurerm\_cdn\_frontdoor\_profile\_params](#input\_azurerm\_cdn\_frontdoor\_profile\_params) | Object map for Azure Front Door Profile module input parameters. | <pre>map(object({<br>    name                     = string # Required<br>    resource_group_name      = string # Required<br>    sku_name                 = string # Required<br>    response_timeout_seconds = number<br>    tags                     = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_profiles"></a> [frontdoor\_profiles](#output\_frontdoor\_profiles) | An object containing the Azure Front Door Profiles created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->