[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
provider "azurerm" {
  features {}
}

module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_name01 = {
      name          = local.name
      prefixes      = local.prefixes
      suffixes      = local.suffixes
      random_length = local.random_length
      random_seed   = null
      resource_type = local.resource_type
      separator     = null
      clean_input   = local.clean_input
      passthrough   = null
      use_slug      = null
    }
  }
}

module "tags" {
  source = "app.terraform.io/captionhealth/tags/azurerm"

  tags_params = {
    Application          = local.Application
    Application_Name     = local.Application_Name
    Application_Owner    = local.Application_Owner
    Application_Type     = local.Application_Type
    Business_Criticality = local.Business_Criticality
    Created_On_Date      = local.Created_On_Date
    DR_Tag               = local.DR_Tag
    Data_Classification  = local.Data_Classification
    Deployed_By          = local.Deployed_By
    Environment          = local.Environment
    Managed_By           = local.Managed_By
    Purpose              = local.Purpose
    SLA_Tier             = local.SLA_Tier
    Status               = local.Status
    Take_On_Stream       = local.Take_On_Stream
  }
}

module "resource_group" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  resource_group_params = {
    resource_group1 = {
      location   = local.location
      name       = module.name.azurecaf_names["azurecaf_name01"].result
      managed_by = null
      tags       = module.tags.tags
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

| Name                                                                                                                          | Type     |
|-------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name                                                                                                  | Description | Type                                                                                                                                              | Default | Required |
|-------------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_resource_group_params"></a> [resource\_group\_params](#input\_resource\_group\_params) | n/a         | <pre>map(object({<br>    location   = string<br>    name       = string<br>    managed_by = string<br>    tags       = map(string)<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                | Description |
|-------------------------------------------------------------------------------------|-------------|
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | n/a         |

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
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_params"></a> [resource\_group\_params](#input\_resource\_group\_params) | n/a | <pre>map(object({<br>    location   = string<br>    name       = string<br>    managed_by = string<br>    tags       = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->
