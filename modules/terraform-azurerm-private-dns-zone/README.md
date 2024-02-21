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
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_zone_params"></a> [azurerm\_private\_dns\_zone\_params](#input\_azurerm\_private\_dns\_zone\_params) | Object map for Azure Private DNS Zone module input parameters. | <pre>map(object({<br>    name                = string # required<br>    resource_group_name = string # required<br>    tags                = map(string)<br><br>    soa_record = list(object({<br>      email        = string # required<br>      expire_time  = number<br>      minimum_ttl  = number<br>      refresh_time = number<br>      retry_time   = number<br>      ttl          = number<br>      tags         = map(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zones"></a> [private\_dns\_zones](#output\_private\_dns\_zones) | An object containing the Private DNS Zones created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->