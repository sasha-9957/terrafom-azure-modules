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
| [azurerm_private_dns_txt_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_txt_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_dns_txt_record_params"></a> [azurerm\_private\_dns\_txt\_record\_params](#input\_azurerm\_private\_dns\_txt\_record\_params) | Object map for Azure Private DNS TXT Record module input parameters. | <pre>map(object({<br>    name                = string # Required<br>    resource_group_name = string # Required<br>    zone_name           = string # Required<br>    ttl                 = number # Required<br>    tags                = map(string)<br><br>    record = map(object({ # Required<br>      value = string      # Required<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_txt_records"></a> [private\_dns\_txt\_records](#output\_private\_dns\_txt\_records) | An object containing the Private DNS TXT Records created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->