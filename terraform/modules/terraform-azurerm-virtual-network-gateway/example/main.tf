# Please be aware that provisioning a Virtual Network Gateway takes a long time (between 30 minutes and 1 hour)
module "virtual_network_gateway" {
  source  = "app.terraform.io/captionhealth/virtual-network-gateway/azurerm"
  version = "1.0.0"

  azurerm_virtual_network_gateway_params = {
    vnet_gateway1 = {
      location                              = module.resource_group.resource_groups["main_rg"].location # Required
      name                                  = module.name.names["main_vnet_gateway"].result             # Required
      resource_group_name                   = module.resource_group.resource_groups["main_rg"].name     # Required
      sku                                   = "VpnGw2"                                                  # Required
      type                                  = "Vpn"                                                     # Required
      active_active                         = false
      default_local_network_gateway_id      = null
      edge_zone                             = null
      enable_bgp                            = false
      generation                            = "Generation2"
      private_ip_address_enabled            = null
      bgp_route_translation_for_nat_enabled = null
      dns_forwarding_enabled                = null
      ip_sec_replay_protection_enabled      = null
      remote_vnet_traffic_enabled           = null
      virtual_wan_traffic_enabled           = null
      vpn_type                              = "RouteBased"
      tags                                  = module.tags.tags

      ip_configuration = [ # Required
        {
          name                          = "vnetGatewayConfig1"
          private_ip_address_allocation = "Dynamic"
          subnet_id                     = module.subnet.subnets["subnet1"].id          # Required
          public_ip_address_id          = module.public_ip.public_ips["public_ip1"].id # Required
        }
      ]

      bgp_settings = [
        # {
        #   asn         = bs.value.asn
        #   peer_weight = bs.value.peer_weight

        #   peering_addresses = [
        #     {
        #       ip_configuration_name = pa.value.ip_configuration_name
        #       apipa_addresses       = pa.value.apipa_addresses
        #     }
        #   ]
        # }
      ]

      custom_route = [
        # {
        #   address_prefixes = null
        # }
      ]

      policy_group = [
        # {
        #   name       = "vnetGatewayPolicyGroup1" # Required
        #   is_default = true
        #   priority   = null

        #   policy_member = [
        #     {
        #       name  = "vnetGatewayPolicyMember1" # Required
        #       type  = "AADGroupId"               # Required
        #       value = "sampleAttributeValue"     # Required
        #     }
        #   ]
        # }
      ]

      vpn_client_configuration = [
        #         {
        #           address_space         = ["10.2.0.0/24"] # Required
        #           aad_tenant            = null
        #           aad_audience          = null
        #           aad_issuer            = null
        #           radius_server_address = null
        #           radius_server_secret  = null
        #           vpn_client_protocols  = "OpenVPN"
        #           vpn_auth_types        = "AAD"

        #           ipsec_policy = [
        #             {
        #               dh_group                  = "DHGroup1" # Required
        #               ike_encryption            = "DES3"     # Required
        #               ike_integrity             = "SHA1"     # Required
        #               ipsec_encryption          = "DES3"     # Required
        #               ipsec_integrity           = "SHA1"     # Required
        #               pfs_group                 = "PFS1"     # Required
        #               sa_lifetime_in_seconds    = 300        # Required
        #               sa_data_size_in_kilobytes = 1024       # Required
        #             }
        #           ]

        #           root_certificate = [
        #             {
        #               name = "DigiCert-Federated-ID-Root-CA" # Required
        #               # Required
        #               public_cert_data = <<EOF
        # MIIDuzCCAqOgAwIBAgIQCHTZWCM+IlfFIRXIvyKSrjANBgkqhkiG9w0BAQsFADBn
        # MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
        # d3cuZGlnaWNlcnQuY29tMSYwJAYDVQQDEx1EaWdpQ2VydCBGZWRlcmF0ZWQgSUQg
        # Um9vdCBDQTAeFw0xMzAxMTUxMjAwMDBaFw0zMzAxMTUxMjAwMDBaMGcxCzAJBgNV
        # BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
        # Y2VydC5jb20xJjAkBgNVBAMTHURpZ2lDZXJ0IEZlZGVyYXRlZCBJRCBSb290IENB
        # MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvAEB4pcCqnNNOWE6Ur5j
        # QPUH+1y1F9KdHTRSza6k5iDlXq1kGS1qAkuKtw9JsiNRrjltmFnzMZRBbX8Tlfl8
        # zAhBmb6dDduDGED01kBsTkgywYPxXVTKec0WxYEEF0oMn4wSYNl0lt2eJAKHXjNf
        # GTwiibdP8CUR2ghSM2sUTI8Nt1Omfc4SMHhGhYD64uJMbX98THQ/4LMGuYegou+d
        # GTiahfHtjn7AboSEknwAMJHCh5RlYZZ6B1O4QbKJ+34Q0eKgnI3X6Vc9u0zf6DH8
        # Dk+4zQDYRRTqTnVO3VT8jzqDlCRuNtq6YvryOWN74/dq8LQhUnXHvFyrsdMaE1X2
        # DwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNV
        # HQ4EFgQUGRdkFnbGt1EWjKwbUne+5OaZvRYwHwYDVR0jBBgwFoAUGRdkFnbGt1EW
        # jKwbUne+5OaZvRYwDQYJKoZIhvcNAQELBQADggEBAHcqsHkrjpESqfuVTRiptJfP
        # 9JbdtWqRTmOf6uJi2c8YVqI6XlKXsD8C1dUUaaHKLUJzvKiazibVuBwMIT84AyqR
        # QELn3e0BtgEymEygMU569b01ZPxoFSnNXc7qDZBDef8WfqAV/sxkTi8L9BkmFYfL
        # uGLOhRJOFprPdoDIUBB+tmCl3oDcBy3vnUeOEioz8zAkprcb3GHwHAK+vHmmfgcn
        # WsfMLH4JCLa/tRYL+Rw/N3ybCkDp00s0WUZ+AoDywSl0Q/ZEnNY0MsFiw6LyIdbq
        # M/s/1JRtO3bDSzD9TazRVzn2oBqzSa8VgIo5C1nOnoAKJTlsClJKvIhnRlaLQqk=
        # EOF
        #             }
        #           ]

        #           revoked_certificate = [
        #             {
        #               name       = "Verizon-Global-Root-CA"                   # Required
        #               thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1" # Required
        #             }
        #           ]

        #           radius_server = [
        #             {
        #               address = "10.2.0.250"     # Required
        #               secret  = "myRadiusSecret" # Required
        #               score   = 1                # Required
        #             }
        #           ]
        #         }
      ]

      virtual_network_gateway_client_connection = [
        # {
        #   name               = "vnetGatewayClientConnection1"                         # Required
        #   policy_group_names = ["vnetGatewayPolicyGroup2", "vnetGatewayPolicyGroup2"] # Required
        #   address_prefixes   = ["/24"]                                                # Required
        # }
      ]
    }
  }
}
