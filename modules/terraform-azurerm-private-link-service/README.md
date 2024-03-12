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
| [azurerm_private_link_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_private_link_service_params"></a> [azurerm\_private\_link\_service\_params](#input\_azurerm\_private\_link\_service\_params) | Object map for Azure Private Link Service module input parameters. | <pre>map(object({<br>    name                                        = string      # Required<br>    resource_group_name                         = string      # Required<br>    location                                    = string      # Required<br>    load_balancer_frontend_ip_configuration_ids = set(string) # Required<br>    auto_approval_subscription_ids              = set(string)<br>    enable_proxy_protocol                       = bool<br>    fqdns                                       = list(string)<br>    tags                                        = map(string)<br>    visibility_subscription_ids                 = set(string)<br><br>    nat_ip_configuration = list(object({<br>      name                       = string # Required<br>      subnet_id                  = string # Required<br>      primary                    = bool   # Required<br>      private_ip_address         = string<br>      private_ip_address_version = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_link_services"></a> [private\_link\_services](#output\_private\_link\_services) | An object containing the Private Link Services created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->