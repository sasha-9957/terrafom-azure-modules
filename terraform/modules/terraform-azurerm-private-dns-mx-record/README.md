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
| [azurerm_private_dns_mx_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_mx_record_params"></a> [azurerm\_private\_dns\_mx\_record\_params](#input\_azurerm\_private\_dns\_mx\_record\_params) | Object map for Azure Private DNS MX Record module input parameters. | <pre>map(object({<br>    name                = string<br>    resource_group_name = string # Required<br>    zone_name           = string # Required<br>    ttl                 = number # Required<br>    tags                = map(string)<br>    record = map(object({ # Required<br>      preference = number # Required<br>      exchange   = string # Required<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_mx_records"></a> [private\_dns\_mx\_records](#output\_private\_dns\_mx\_records) | An object containing the Private DNS MX Records created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->