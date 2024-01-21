[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "tags" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  tags_params = {
    managed_by = "terraform"
    dept       = "dev"
    owner      = "DevOps"
    intent     = "dev environment provisioning"
  }
}
```



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags_params"></a> [tags\_params](#input\_tags\_params) | n/a | <pre>object({<br>    managed_by = string<br>    dept       = string<br>    owner      = string<br>    intent     = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags_params"></a> [tags\_params](#input\_tags\_params) | n/a | <pre>object({<br>    managed_by = string<br>    dept       = string<br>    owner      = string<br>    intent     = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->