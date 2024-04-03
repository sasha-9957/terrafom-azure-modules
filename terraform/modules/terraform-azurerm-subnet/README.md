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
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_subnet_params"></a> [azurerm\_subnet\_params](#input\_azurerm\_subnet\_params) | Object map for Azure Subnet module input parameters. | <pre>map(object({<br>    name                                          = string       # Required<br>    resource_group_name                           = string       # Required<br>    virtual_network_name                          = string       # Required<br>    address_prefixes                              = list(string) # Required<br>    private_endpoint_network_policies_enabled     = bool<br>    private_link_service_network_policies_enabled = bool<br>    service_endpoints                             = set(string)<br>    service_endpoint_policy_ids                   = set(string)<br><br>    delegation = list(object({<br>      name = string<br><br>      service_delegation = list(object({ # Required<br>        name    = string                 # Required<br>        actions = list(string)<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | An object containing the Azure Subnets created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->