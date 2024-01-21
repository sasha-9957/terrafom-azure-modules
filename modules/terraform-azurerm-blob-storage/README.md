[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "blob_storage" {
  source = "app.terraform.io/captionhealth/blob-storage/azurerm"

  azurerm_storage_blob_params = {
    test_blob_storage = {
      name                   = "hhcompbs" # required
      storage_account_name   = "hhcompsa" # required
      storage_container_name = "hhcompsc" # required
      type                   = "Block"    # required
      size                   = null
      access_tier            = null
      cache_control          = null
      content_type           = null
      content_md5            = null
      source                 = null
      source_content         = null
      source_uri             = null
      parallelism            = null
      metadata               = null
    }
  }
}
```

## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | ~> 3.0  |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                      | Type     |
|---------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_storage_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name                                                                                                                      | Description | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default | Required |
|---------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_azurerm_storage_blob_params"></a> [azurerm\_storage\_blob\_params](#input\_azurerm\_storage\_blob\_params) | n/a         | <pre>map(object({<br>    name                   = string # required<br>    storage_account_name   = string # required<br>    storage_container_name = string # required<br>    type                   = string # required<br>    size                   = number<br>    access_tier            = string<br>    cache_control          = string<br>    content_type           = string<br>    content_md5            = string<br>    source                 = string<br>    source_content         = string<br>    source_uri             = string<br>    parallelism            = number<br>    metadata               = map(string)<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                          | Description |
|-------------------------------------------------------------------------------|-------------|
| <a name="output_blob_storages"></a> [blob\_storages](#output\_blob\_storages) | n/a         |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_blob_params"></a> [azurerm\_storage\_blob\_params](#input\_azurerm\_storage\_blob\_params) | n/a | <pre>map(object({<br>    name                   = string # required<br>    storage_account_name   = string # required<br>    storage_container_name = string # required<br>    type                   = string # required<br>    size                   = number<br>    access_tier            = string<br>    cache_control          = string<br>    content_type           = string<br>    content_md5            = string<br>    source                 = string<br>    source_content         = string<br>    source_uri             = string<br>    parallelism            = number<br>    metadata               = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_blob_storages"></a> [blob\_storages](#output\_blob\_storages) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->
