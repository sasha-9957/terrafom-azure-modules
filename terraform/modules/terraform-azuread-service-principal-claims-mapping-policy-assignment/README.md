<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_service_principal_claims_mapping_policy_assignment.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_claims_mapping_policy_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_service_principal_claims_mapping_policy_assignment_params"></a> [azuread\_service\_principal\_claims\_mapping\_policy\_assignment\_params](#input\_azuread\_service\_principal\_claims\_mapping\_policy\_assignment\_params) | Object map for Azure Service Principal Claims Mapping Policy Assignment module input parameters. | <pre>map(object({<br>    claims_mapping_policy_id = string # Require<br>    service_principal_id     = string # Require<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal_claims_mapping_policy_assignments"></a> [service\_principal\_claims\_mapping\_policy\_assignments](#output\_service\_principal\_claims\_mapping\_policy\_assignments) | An object containing the Azure Service Principal Claims Mapping Policy Assignment created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->