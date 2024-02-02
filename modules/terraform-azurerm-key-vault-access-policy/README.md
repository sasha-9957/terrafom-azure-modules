[//]: # (BEGIN_TF_DOCS)


### Example:

```hcl
module "key_vault_access_policy" {

  source = "../modules/terraform-azurerm-key-vault-access-policy"

  azurerm_key_vault_access_policy_params = {
    key_vault_access_policy = {
      key_vault_id            = azurerm_key_vault.test.id
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["List", "Get", "Create", "Delete"]
      secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
      application_id          = null
      certificate_permissions = ["List", "Get", "Create", "Delete"]
      storage_permissions     = null
    }
  }
}
```



## Requirements

| Name | Version |
|------|---------|
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
| [azurerm_key_vault_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_key_vault_access_policy_params"></a> [azurerm\_key\_vault\_access\_policy\_params](#input\_azurerm\_key\_vault\_access\_policy\_params) | Object map for Azure Key Vault Access Policy module input parameters. | <pre>map(object({<br>    key_vault_id            = string<br>    tenant_id               = string<br>    object_id               = string<br>    application_id          = string<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>    certificate_permissions = list(string)<br>    storage_permissions     = list(string)<br><br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_access_policy"></a> [key\_vault\_access\_policy](#output\_key\_vault\_access\_policy) | An object containing the Key Vaults Access Policy created by the module |

[//]: # (END_TF_DOCS)