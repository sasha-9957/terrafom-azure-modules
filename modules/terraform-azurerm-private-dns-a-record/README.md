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
| [azurerm_private_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_a_record_params"></a> [azurerm\_private\_dns\_a\_record\_params](#input\_azurerm\_private\_dns\_a\_record\_params) | Object map for Azure Private DNS A Record module input parameters. | <pre>map(object({<br>    name                = string      # required<br>    resource_group_name = string      # required<br>    zone_name           = string      # required<br>    ttl                 = number      # required<br>    records             = set(string) # required<br>    tags                = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_a_records"></a> [private\_dns\_a\_records](#output\_private\_dns\_a\_records) | An object containing the Private DNS A Records created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->