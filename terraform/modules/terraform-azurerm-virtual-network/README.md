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
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_virtual_network_params"></a> [azurerm\_virtual\_network\_params](#input\_azurerm\_virtual\_network\_params) | Object map for Azure Virtual Network module input parameters. | <pre>map(object({<br>    name                = string       # required<br>    resource_group_name = string       # required<br>    address_space       = list(string) # required<br>    location            = string       # required<br>    bgp_community       = string<br>    ddos_protection_plan = list(object({<br>      id     = string<br>      enable = bool<br>    }))<br>    encryption = list(object({<br>      enforcement = bool # required<br>    }))<br>    dns_servers             = list(string)<br>    edge_zone               = string<br>    flow_timeout_in_minutes = number<br>    subnet = list(object({<br>      name           = string # required<br>      address_prefix = string # required<br>      security_group = string<br>    }))<br>    tags = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_networks"></a> [virtual\_networks](#output\_virtual\_networks) | An object containing the Virtual Networks created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->