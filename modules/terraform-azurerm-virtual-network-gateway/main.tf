resource "azurerm_virtual_network_gateway" "this" {
  for_each = var.azurerm_virtual_network_gateway_params

  # Please be aware that provisioning a Virtual Network Gateway takes a long time (between 30 minutes and 1 hour)

  location                              = each.value.location            # Required
  name                                  = each.value.name                # Required
  resource_group_name                   = each.value.resource_group_name # Required
  sku                                   = each.value.sku                 # Required
  type                                  = each.value.type                # Required
  active_active                         = each.value.active_active
  default_local_network_gateway_id      = each.value.default_local_network_gateway_id
  edge_zone                             = each.value.edge_zone
  enable_bgp                            = each.value.enable_bgp
  generation                            = each.value.generation
  private_ip_address_enabled            = each.value.private_ip_address_enabled
  bgp_route_translation_for_nat_enabled = each.value.bgp_route_translation_for_nat_enabled
  dns_forwarding_enabled                = each.value.dns_forwarding_enabled
  ip_sec_replay_protection_enabled      = each.value.ip_sec_replay_protection_enabled
  remote_vnet_traffic_enabled           = each.value.remote_vnet_traffic_enabled
  virtual_wan_traffic_enabled           = each.value.virtual_wan_traffic_enabled
  vpn_type                              = each.value.vpn_type
  tags                                  = each.value.tags


  dynamic "ip_configuration" { # Required
    iterator = ic
    for_each = each.value.ip_configuration

    content {
      name                          = each.value.name
      private_ip_address_allocation = each.value.private_ip_address_allocation
      subnet_id                     = each.value.subnet_id            # Required
      public_ip_address_id          = each.value.public_ip_address_id # Required
    }
  }

  dynamic "bgp_settings" {
    iterator = bs
    for_each = each.value.bgp_settings

    content {
      asn         = bs.value.asn
      peer_weight = bs.value.peer_weight

      dynamic "peering_addresses" {
        iterator = pa
        for_each = bs.value.peering_addresses

        content {
          ip_configuration_name = pa.value.ip_configuration_name
          apipa_addresses       = pa.value.apipa_addresses
        }
      }
    }
  }

  dynamic "custom_route" {
    iterator = cr
    for_each = each.value.custom_route

    content {
      address_prefixes = cr.value.address_prefixes
    }
  }

  dynamic "policy_group" {
    iterator = pg
    for_each = each.value.policy_group

    content {
      name       = pg.value.name # Required
      is_default = pg.value.is_default
      priority   = pg.value.priority

      dynamic "policy_member" { # Required
        iterator = pm
        for_each = pg.value.policy_member

        content {
          name  = pm.value.name  # Required
          type  = pm.value.type  # Required
          value = pm.value.value # Required
        }
      }
    }

  }

  dynamic "vpn_client_configuration" {
    iterator = vcc
    for_each = each.value.vpn_client_configuration

    content {
      address_space         = vcc.value.address_space # Required
      aad_tenant            = vcc.value.aad_tenant
      aad_audience          = vcc.value.aad_audience
      aad_issuer            = vcc.value.aad_issuer
      radius_server_address = vcc.value.radius_server_address
      radius_server_secret  = vcc.value.radius_server_secret
      vpn_client_protocols  = vcc.value.vpn_client_protocols
      vpn_auth_types        = vcc.value.vpn_auth_types

      dynamic "ipsec_policy" {
        iterator = ip
        for_each = vcc.value.ipsec_policy

        content {
          dh_group                  = ip.value.dh_group                  # Required
          ike_encryption            = ip.value.ike_encryption            # Required
          ike_integrity             = ip.value.ike_integrity             # Required
          ipsec_encryption          = ip.value.ipsec_encryption          # Required
          ipsec_integrity           = ip.value.ipsec_integrity           # Required
          pfs_group                 = ip.value.pfs_group                 # Required
          sa_lifetime_in_seconds    = ip.value.sa_lifetime_in_seconds    # Required
          sa_data_size_in_kilobytes = ip.value.sa_data_size_in_kilobytes # Required
        }
      }

      dynamic "root_certificate" {
        iterator = rc
        for_each = vcc.value.root_certificate

        content {
          name             = rc.value.name             # Required
          public_cert_data = rc.value.public_cert_data # Required
        }
      }

      dynamic "revoked_certificate" {
        iterator = rec
        for_each = vcc.value.revoked_certificate

        content {
          name       = rec.value.name       # Required
          thumbprint = rec.value.thumbprint # Required
        }
      }

      dynamic "radius_server" {
        iterator = rs
        for_each = vcc.value.radius_server

        content {
          address = rs.value.address # Required
          secret  = rs.value.secret  # Required
          score   = rs.value.score   # Required
        }
      }
    }
  }

  dynamic "virtual_network_gateway_client_connection" {
    iterator = vngcc
    for_each = each.value.virtual_network_gateway_client_connection

    content {
      name               = vngcc.value.name               # Required
      policy_group_names = vngcc.value.policy_group_names # Required
      address_prefixes   = vngcc.value.address_prefixes   # Required
    }
  }
}
