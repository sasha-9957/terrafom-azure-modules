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
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_key_vault_params"></a> [azurerm\_key\_vault\_params](#input\_azurerm\_key\_vault\_params) | Object map for Azure Key Vault module input parameters. | <pre>map(object({<br>    name                            = string # required<br>    location                        = string # required<br>    resource_group_name             = string # required<br>    sku_name                        = string # required<br>    tenant_id                       = string # required<br>    enabled_for_deployment          = bool<br>    enabled_for_disk_encryption     = bool<br>    enabled_for_template_deployment = bool<br>    enable_rbac_authorization       = bool<br>    purge_protection_enabled        = bool<br>    public_network_access_enabled   = bool<br>    soft_delete_retention_days      = number<br>    tags                            = map(string)<br><br>    access_policy = list(object({<br>      tenant_id               = string # required<br>      object_id               = string # required<br>      application_id          = string<br>      certificate_permissions = list(string)<br>      key_permissions         = list(string)<br>      secret_permissions      = list(string)<br>      storage_permissions     = list(string)<br>    }))<br><br>    network_acls = list(object({<br>      bypass                     = string # required<br>      default_action             = string # required<br>      ip_rules                   = set(string)<br>      virtual_network_subnet_ids = set(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vaults"></a> [key\_vaults](#output\_key\_vaults) | An object containing the Key Vaults created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->