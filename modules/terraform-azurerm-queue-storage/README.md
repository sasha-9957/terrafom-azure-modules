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
| [azurerm_storage_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_queue_params"></a> [azurerm\_storage\_queue\_params](#input\_azurerm\_storage\_queue\_params) | Object map for Azure Storage Queue module input parameters. | <pre>map(object({<br>    name                 = string # required<br>    storage_account_name = string # required<br>    metadata             = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue_storages"></a> [queue\_storages](#output\_queue\_storages) | An object containing the Queue Storages created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->