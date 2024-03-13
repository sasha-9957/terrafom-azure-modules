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
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_virtual_network_gateway_params"></a> [azurerm\_virtual\_network\_gateway\_params](#input\_azurerm\_virtual\_network\_gateway\_params) | Object map for Azure Virtual Network Gateway module input parameters. | <pre>map(object({<br>    location                              = string # Required<br>    name                                  = string # Required<br>    resource_group_name                   = string # Required<br>    sku                                   = string # Required<br>    type                                  = string # Required<br>    active_active                         = bool<br>    default_local_network_gateway_id      = string<br>    edge_zone                             = string<br>    enable_bgp                            = bool<br>    generation                            = string<br>    private_ip_address_enabled            = bool<br>    bgp_route_translation_for_nat_enabled = bool<br>    dns_forwarding_enabled                = bool<br>    ip_sec_replay_protection_enabled      = bool<br>    remote_vnet_traffic_enabled           = bool<br>    virtual_wan_traffic_enabled           = bool<br>    vpn_type                              = string<br>    tags                                  = map(string)<br><br>    ip_configuration = list(object({<br>      name                          = string<br>      private_ip_address_allocation = string<br>      subnet_id                     = string # Required<br>      public_ip_address_id          = string # Required<br>    }))<br><br>    bgp_settings = list(object({<br>      asn         = number<br>      peer_weight = number<br>      peering_addresses = list(object({<br>        ip_configuration_name = string<br>        apipa_addresses       = list(string)<br>      }))<br>    }))<br><br>    custom_route = list(object({<br>      address_prefixes = set(string)<br>    }))<br><br>    policy_group = list(object({<br>      name       = string # Required<br>      is_default = bool<br>      priority   = number<br>      policy_member = list(object({ # Required<br>        name  = string              # Required<br>        type  = string              # Required<br>        value = string              # Required<br>      }))<br>    }))<br><br>    vpn_client_configuration = list(object({<br>      address_space         = list(string) # Required<br>      aad_tenant            = string<br>      aad_audience          = string<br>      aad_issuer            = string<br>      radius_server_address = string<br>      radius_server_secret  = string<br>      vpn_client_protocols  = set(string)<br>      vpn_auth_types        = set(string)<br>      ipsec_policy = list(object({<br>        dh_group                  = string # Required<br>        ike_encryption            = string # Required<br>        ike_integrity             = string # Required<br>        ipsec_encryption          = string # Required<br>        ipsec_integrity           = string # Required<br>        pfs_group                 = string # Required<br>        sa_lifetime_in_seconds    = number # Required<br>        sa_data_size_in_kilobytes = number # Required<br>      }))<br>      root_certificate = list(object({<br>        name             = string # Required<br>        public_cert_data = string # Required<br>      }))<br>      revoked_certificate = list(object({<br>        name       = string # Required<br>        thumbprint = string # Required<br>      }))<br>      radius_server = list(object({<br>        address = string # Required<br>        secret  = string # Required<br>        score   = number # Required<br>      }))<br>    }))<br><br>    virtual_network_gateway_client_connection = list(object({<br>      name               = string       # Required<br>      policy_group_names = list(string) # Required<br>      address_prefixes   = list(string) # Required<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_network_gateways"></a> [virtual\_network\_gateways](#output\_virtual\_network\_gateways) | An object containing the Azure Virtual Network Gateways created by the module. |
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->