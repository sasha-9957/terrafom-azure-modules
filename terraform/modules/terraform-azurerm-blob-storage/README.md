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
| [azurerm_storage_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_blob_params"></a> [azurerm\_storage\_blob\_params](#input\_azurerm\_storage\_blob\_params) | Object map for Azure Blob Storage module input parameters. | <pre>map(object({<br>    name                   = string # required<br>    storage_account_name   = string # required<br>    storage_container_name = string # required<br>    type                   = string # required<br>    size                   = number<br>    access_tier            = string<br>    cache_control          = string<br>    content_type           = string<br>    content_md5            = string<br>    source                 = string<br>    source_content         = string<br>    source_uri             = string<br>    parallelism            = number<br>    metadata               = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blob_storages"></a> [blob\_storages](#output\_blob\_storages) | An object containing the Blob Storages created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->