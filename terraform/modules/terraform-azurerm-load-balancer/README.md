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
| [azurerm_lb.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_lb_params"></a> [azurerm\_lb\_params](#input\_azurerm\_lb\_params) | Object map for Azure Load Balancer module input parameters. | <pre>map(object({<br>    name                = string # Required<br>    resource_group_name = string # Required<br>    location            = string # Required<br>    edge_zone           = string<br>    sku                 = string<br>    sku_tier            = string<br>    tags                = map(string)<br><br>    frontend_ip_configuration = list(object({<br>      name                                               = string # Required<br>      zones                                              = set(string)<br>      subnet_id                                          = string<br>      gateway_load_balancer_frontend_ip_configuration_id = string<br>      private_ip_address                                 = string<br>      private_ip_address_allocation                      = string<br>      private_ip_address_version                         = string<br>      public_ip_address_id                               = string<br>      public_ip_prefix_id                                = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancers"></a> [load\_balancers](#output\_load\_balancers) | An object containing the Azure Load Balancers created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->