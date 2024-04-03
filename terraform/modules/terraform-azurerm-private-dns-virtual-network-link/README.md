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
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_zone_virtual_network_link_params"></a> [azurerm\_private\_dns\_zone\_virtual\_network\_link\_params](#input\_azurerm\_private\_dns\_zone\_virtual\_network\_link\_params) | Object map for Azure Private DNS Zone Virtual Network Link module input parameters. | <pre>map(object({<br>    name                  = string # Required<br>    private_dns_zone_name = string # Required<br>    resource_group_name   = string # Required<br>    virtual_network_id    = string # Required<br>    registration_enabled  = bool<br>    tags                  = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zone_virtual_network_links"></a> [private\_dns\_zone\_virtual\_network\_links](#output\_private\_dns\_zone\_virtual\_network\_links) | An object containing the Azure Private DNS Zone Virtual Network Links created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->