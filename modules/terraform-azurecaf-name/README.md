[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_name01 = {
      name           = local.name
      prefixes       = local.prefixes
      suffixes       = local.suffixes
      random_length  = null
      random_seed    = null
      resource_type  = local.resource_type
      resource_types = null
      separator      = null
      clean_input    = local.clean_input
      passthrough    = null
      use_slug       = null
    }
  }
}
```



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | ~> 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | ~> 1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.this](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurecaf_name_params"></a> [azurecaf\_name\_params](#input\_azurecaf\_name\_params) | n/a | <pre>map(object({<br>    name           = string<br>    prefixes       = list(string)<br>    suffixes       = list(string)<br>    random_length  = number<br>    random_seed    = number<br>    resource_type  = string<br>    resource_types = list(string)<br>    separator      = string<br>    clean_input    = bool<br>    passthrough    = bool<br>    use_slug       = bool<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_names"></a> [names](#output\_names) | n/a |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | ~> 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | ~> 1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.this](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurecaf_name_params"></a> [azurecaf\_name\_params](#input\_azurecaf\_name\_params) | n/a | <pre>map(object({<br>    name           = string<br>    prefixes       = list(string)<br>    suffixes       = list(string)<br>    random_length  = number<br>    random_seed    = number<br>    resource_type  = string<br>    resource_types = list(string)<br>    separator      = string<br>    clean_input    = bool<br>    passthrough    = bool<br>    use_slug       = bool<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_names"></a> [names](#output\_names) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->