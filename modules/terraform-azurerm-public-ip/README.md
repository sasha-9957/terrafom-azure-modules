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
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_public_ip_params"></a> [azurerm\_public\_ip\_params](#input\_azurerm\_public\_ip\_params) | Object map for Azure Public IP module input parameters. | <pre>map(object({<br>    name                    = string # Required<br>    resource_group_name     = string # Required<br>    location                = string # Required<br>    allocation_method       = string # Required<br>    zones                   = set(string)<br>    ddos_protection_mode    = string<br>    ddos_protection_plan_id = string<br>    domain_name_label       = string<br>    edge_zone               = string<br>    idle_timeout_in_minutes = number<br>    ip_tags                 = map(string)<br>    ip_version              = string<br>    public_ip_prefix_id     = string<br>    reverse_fqdn            = string<br>    sku                     = string<br>    sku_tier                = string<br>    tags                    = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ips"></a> [public\_ips](#output\_public\_ips) | An object containing the Public IPs created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->