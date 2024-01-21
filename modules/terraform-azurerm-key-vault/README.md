[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
module "key_vault" {
  source = "app.terraform.io/captionhealth/key-vault/azurerm"

  azurerm_key_vault_params = {
    main_key_vault = {
      name                            = each.value.name                # required
      location                        = each.value.location            # required
      resource_group_name             = each.value.resource_group_name # required
      sku_name                        = each.value.sku_name            # required
      tenant_id                       = each.value.tenant_id           # required
      enabled_for_deployment          = null
      enabled_for_disk_encryption     = null
      enabled_for_template_deployment = null
      enable_rbac_authorization       = null
      purge_protection_enabled        = null
      public_network_access_enabled   = null
      soft_delete_retention_days      = null
      tags                            = null
    }
  }
}
```

## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5  |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                | Type     |
|---------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |

## Inputs

| Name                                                                                                             | Description | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default | Required |
|------------------------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_azurerm_key_vault_params"></a> [azurerm\_key\_vault\_params](#input\_azurerm\_key\_vault\_params) | n/a         | <pre>map(object({<br>    name                            = string # required<br>    location                        = string # required<br>    resource_group_name             = string # required<br>    sku_name                        = string # required<br>    tenant_id                       = string # required<br>    enabled_for_deployment          = bool<br>    enabled_for_disk_encryption     = bool<br>    enabled_for_template_deployment = bool<br>    enable_rbac_authorization       = bool<br>    purge_protection_enabled        = bool<br>    public_network_access_enabled   = bool<br>    soft_delete_retention_days      = number<br>    tags                            = map(string)<br><br>    access_policy = map(object({<br>      tenant_id               = string # required<br>      object_id               = string # required<br>      application_id          = string<br>      certificate_permissions = list(string)<br>      key_permissions         = list(string)<br>      secret_permissions      = list(string)<br>      storage_permissions     = list(string)<br>    }))<br><br>    network_acls = map(object({<br>      bypass                     = string # required<br>      default_action             = string # required<br>      ip_rules                   = set(string)<br>      virtual_network_subnet_ids = set(string)<br>    }))<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                 | Description |
|----------------------------------------------------------------------|-------------|
| <a name="output_key_vaults"></a> [key\_vaults](#output\_key\_vaults) | n/a         |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_key_vault_params"></a> [azurerm\_key\_vault\_params](#input\_azurerm\_key\_vault\_params) | n/a | <pre>map(object({<br>    name                            = string # required<br>    location                        = string # required<br>    resource_group_name             = string # required<br>    sku_name                        = string # required<br>    tenant_id                       = string # required<br>    enabled_for_deployment          = bool<br>    enabled_for_disk_encryption     = bool<br>    enabled_for_template_deployment = bool<br>    enable_rbac_authorization       = bool<br>    purge_protection_enabled        = bool<br>    public_network_access_enabled   = bool<br>    soft_delete_retention_days      = number<br>    tags                            = map(string)<br><br>    access_policy = map(object({<br>      tenant_id               = string # required<br>      object_id               = string # required<br>      application_id          = string<br>      certificate_permissions = list(string)<br>      key_permissions         = list(string)<br>      secret_permissions      = list(string)<br>      storage_permissions     = list(string)<br>    }))<br><br>    network_acls = map(object({<br>      bypass                     = string # required<br>      default_action             = string # required<br>      ip_rules                   = set(string)<br>      virtual_network_subnet_ids = set(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vaults"></a> [key\_vaults](#output\_key\_vaults) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->
