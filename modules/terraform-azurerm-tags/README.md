<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.89 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags_params"></a> [tags\_params](#input\_tags\_params) | Object map for Azure Tags module input parameters. | <pre>object({<br>    managed_by = string<br>    dept       = string<br>    owner      = string<br>    intent     = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | An object containing the Tags created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->