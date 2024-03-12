<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.91 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.91 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_endpoint_params"></a> [azurerm\_private\_endpoint\_params](#input\_azurerm\_private\_endpoint\_params) | Object map for Azure Private Endpoint module input parameters. | <pre>map(object({<br><br>    name                          = string # Required<br>    resource_group_name           = string # Required<br>    location                      = string # Required<br>    subnet_id                     = string # Required<br>    custom_network_interface_name = string<br>    tags                          = map(string)<br><br>    private_dns_zone_group = list(object({<br>      name                 = string       # Required<br>      private_dns_zone_ids = list(string) # Required<br>    }))<br><br>    private_service_connection = list(object({<br>      name                              = string # Required<br>      is_manual_connection              = bool   # Required<br>      private_connection_resource_id    = string<br>      private_connection_resource_alias = string<br>      subresource_names                 = list(string)<br>      request_message                   = string<br>    }))<br><br>    ip_configuration = list(object({<br>      name               = string # Required<br>      private_ip_address = string # Required<br>      subresource_name   = string<br>      member_name        = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoints"></a> [private\_endpoints](#output\_private\_endpoints) | An object containing the Azure Private Endpoints created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->