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
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_params"></a> [resource\_group\_params](#input\_resource\_group\_params) | Object map for Azure Resource Groups module input parameters. | <pre>map(object({<br>    location   = string<br>    name       = string<br>    managed_by = string<br>    tags       = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | An object containing the Resource Groups created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->