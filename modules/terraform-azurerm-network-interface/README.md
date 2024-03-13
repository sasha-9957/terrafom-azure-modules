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
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_network_interface_params"></a> [azurerm\_network\_interface\_params](#input\_azurerm\_network\_interface\_params) | Object map for Azure Network Interface module input parameters. | <pre>map(object({<br>    location            = string # Required<br>    name                = string # Required<br>    resource_group_name = string # Required<br>    # auxiliary_mode is in Preview and requires that the preview is enabled<br>    auxiliary_mode = string<br>    # auxiliary_sku is in Preview and requires that the preview is enabled<br>    auxiliary_sku                 = string<br>    dns_servers                   = list(string)<br>    edge_zone                     = string<br>    enable_ip_forwarding          = bool<br>    enable_accelerated_networking = bool<br>    internal_dns_name_label       = string<br>    tags                          = map(string)<br><br>    ip_configuration = list(object({<br>      name                                               = string # Required<br>      gateway_load_balancer_frontend_ip_configuration_id = string<br>      subnet_id                                          = string<br>      private_ip_address_version                         = string<br>      private_ip_address_allocation                      = string # Required<br>      public_ip_address_id                               = string<br>      primary                                            = bool<br>      private_ip_address                                 = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_interfaces"></a> [network\_interfaces](#output\_network\_interfaces) | An object containing the Azure Network Interface created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->