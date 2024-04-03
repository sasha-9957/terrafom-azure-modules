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
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_network_security_group_params"></a> [azurerm\_network\_security\_group\_params](#input\_azurerm\_network\_security\_group\_params) | Object map for Azure Network Security Group module input parameters. | <pre>map(object({<br>    name                = string # Required<br>    resource_group_name = string # Required<br>    location            = string # Required<br>    tags                = map(string)<br><br>    security_rule = list(object({<br>      name                                       = string # Required<br>      description                                = string<br>      protocol                                   = string      # Required<br>      source_port_range                          = string      # Required if source_port_ranges is not specified.<br>      source_port_ranges                         = set(string) # Required if source_port_range is not specified.<br>      destination_port_range                     = string      # Required if destination_port_ranges is not specified.<br>      destination_port_ranges                    = set(string) # Required if destination_port_range is not specified.<br>      source_address_prefix                      = string      # Required if source_address_prefixes is not specified.<br>      source_address_prefixes                    = set(string) # Required if source_address_prefix is not specified.<br>      source_application_security_group_ids      = set(string)<br>      destination_address_prefix                 = string      # Required if destination_address_prefixes is not specified.<br>      destination_address_prefixes               = set(string) # Required if destination_address_prefix is not specified.<br>      destination_application_security_group_ids = set(string)<br>      access                                     = string # Required<br>      priority                                   = number # Required<br>      direction                                  = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_groups"></a> [network\_security\_groups](#output\_network\_security\_groups) | An object containing the Azure Network Security Groups created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->