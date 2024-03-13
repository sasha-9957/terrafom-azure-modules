variable "azurerm_virtual_network_gateway_params" {
  description = "Object map for Azure Virtual Network Gateway module input parameters."
  type = map(object({
    location                              = string # Required
    name                                  = string # Required
    resource_group_name                   = string # Required
    sku                                   = string # Required
    type                                  = string # Required
    active_active                         = bool
    default_local_network_gateway_id      = string
    edge_zone                             = string
    enable_bgp                            = bool
    generation                            = string
    private_ip_address_enabled            = bool
    bgp_route_translation_for_nat_enabled = bool
    dns_forwarding_enabled                = bool
    ip_sec_replay_protection_enabled      = bool
    remote_vnet_traffic_enabled           = bool
    virtual_wan_traffic_enabled           = bool
    vpn_type                              = string
    tags                                  = map(string)

    ip_configuration = list(object({
      name                          = string
      private_ip_address_allocation = string
      subnet_id                     = string # Required
      public_ip_address_id          = string # Required
    }))

    bgp_settings = list(object({
      asn         = number
      peer_weight = number
      peering_addresses = list(object({
        ip_configuration_name = string
        apipa_addresses       = list(string)
      }))
    }))

    custom_route = list(object({
      address_prefixes = set(string)
    }))

    policy_group = list(object({
      name       = string # Required
      is_default = bool
      priority   = number
      policy_member = list(object({ # Required
        name  = string              # Required
        type  = string              # Required
        value = string              # Required
      }))
    }))

    vpn_client_configuration = list(object({
      address_space         = list(string) # Required
      aad_tenant            = string
      aad_audience          = string
      aad_issuer            = string
      radius_server_address = string
      radius_server_secret  = string
      vpn_client_protocols  = set(string)
      vpn_auth_types        = set(string)
      ipsec_policy = list(object({
        dh_group                  = string # Required
        ike_encryption            = string # Required
        ike_integrity             = string # Required
        ipsec_encryption          = string # Required
        ipsec_integrity           = string # Required
        pfs_group                 = string # Required
        sa_lifetime_in_seconds    = number # Required
        sa_data_size_in_kilobytes = number # Required
      }))
      root_certificate = list(object({
        name             = string # Required
        public_cert_data = string # Required
      }))
      revoked_certificate = list(object({
        name       = string # Required
        thumbprint = string # Required
      }))
      radius_server = list(object({
        address = string # Required
        secret  = string # Required
        score   = number # Required
      }))
    }))

    virtual_network_gateway_client_connection = list(object({
      name               = string       # Required
      policy_group_names = list(string) # Required
      address_prefixes   = list(string) # Required
    }))
  }))
}
