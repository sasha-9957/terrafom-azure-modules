<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
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
| [azurerm_cdn_frontdoor_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_endpoint_params"></a> [azurerm\_cdn\_frontdoor\_endpoint\_params](#input\_azurerm\_cdn\_frontdoor\_endpoint\_params) | Object map for Azure Front Door Endpoint module input parameters. | <pre>map(object({<br>    name                     = string # Required<br>    cdn_frontdoor_profile_id = string # Required<br>    enabled                  = bool<br>    tags                     = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_endpoints"></a> [frontdoor\_endpoints](#output\_frontdoor\_endpoints) | An object containing the Azure Front Door Endpoints created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->