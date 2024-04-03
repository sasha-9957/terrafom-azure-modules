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
| [azurerm_cdn_frontdoor_custom_domain_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_cdn_frontdoor_custom_domain_association_params"></a> [azurerm\_cdn\_frontdoor\_custom\_domain\_association\_params](#input\_azurerm\_cdn\_frontdoor\_custom\_domain\_association\_params) | Object map for Azure Front Door Custom Domain Association module input parameters. | <pre>map(object({<br>    cdn_frontdoor_custom_domain_id = string       # Required<br>    cdn_frontdoor_route_ids        = list(string) # Required<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_custom_domain_associations"></a> [frontdoor\_custom\_domain\_associations](#output\_frontdoor\_custom\_domain\_associations) | An object containing the Azure Front Door Custom Domain Associations created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->