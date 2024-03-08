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
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_container_params"></a> [azurerm\_storage\_container\_params](#input\_azurerm\_storage\_container\_params) | Object map for Azure Storage Container module input parameters. | <pre>map(object({<br>    name                  = string # required<br>    storage_account_name  = string # required<br>    container_access_type = string<br>    metadata              = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_storage_containers"></a> [azurerm\_storage\_containers](#output\_azurerm\_storage\_containers) | An object containing the Storage Containers created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->