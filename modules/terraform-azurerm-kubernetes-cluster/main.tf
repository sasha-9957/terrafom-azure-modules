resource "azurerm_kubernetes_cluster" "this" {
  for_each = var.azurerm_kubernetes_cluster_params

  name                = each.value.name                # Required
  location            = each.value.location            # Required
  resource_group_name = each.value.resource_group_name # Required
  # You must define either a dns_prefix or a dns_prefix_private_cluster field.
  dns_prefix                          = each.value.dns_prefix
  dns_prefix_private_cluster          = each.value.dns_prefix_private_cluster
  automatic_channel_upgrade           = each.value.automatic_channel_upgrade
  azure_policy_enabled                = each.value.azure_policy_enabled
  custom_ca_trust_certificates_base64 = each.value.custom_ca_trust_certificates_base64
  disk_encryption_set_id              = each.value.disk_encryption_set_id
  edge_zone                           = each.value.edge_zone
  http_application_routing_enabled    = each.value.http_application_routing_enabled
  image_cleaner_enabled               = each.value.image_cleaner_enabled
  image_cleaner_interval_hours        = each.value.image_cleaner_interval_hours
  kubernetes_version                  = each.value.kubernetes_version
  local_account_disabled              = each.value.local_account_disabled
  # This requires that the Preview Feature Microsoft.ContainerService/NodeOsUpgradeChannelPreview is enabled and the Resource Provider is re-registered.
  node_os_channel_upgrade = each.value.node_os_channel_upgrade
  # Azure requires that a new, non-existent Resource Group is used, as otherwise, the provisioning of the Kubernetes Service will fail.
  node_resource_group                 = each.value.node_resource_group
  oidc_issuer_enabled                 = each.value.oidc_issuer_enabled
  open_service_mesh_enabled           = each.value.open_service_mesh_enabled
  private_cluster_enabled             = each.value.private_cluster_enabled
  private_dns_zone_id                 = each.value.private_dns_zone_id
  private_cluster_public_fqdn_enabled = each.value.private_cluster_public_fqdn_enabled
  workload_identity_enabled           = each.value.workload_identity_enabled
  # This is currently not functional and is not passed to the Azure API. For controlling the public and private exposure of a cluster please see the properties private_cluster_enabled and api_server_access_profile.
  # public_network_access_enabled     = each.value.public_network_access_enabled
  role_based_access_control_enabled = each.value.role_based_access_control_enabled
  run_command_enabled               = each.value.run_command_enabled
  sku_tier                          = each.value.sku_tier
  support_plan                      = each.value.support_plan
  tags                              = each.value.tags

  dynamic "default_node_pool" { # Required
    iterator = dnp
    for_each = each.value.default_node_pool

    content {
      name                          = dnp.value.name    # Required
      vm_size                       = dnp.value.vm_size # Required
      capacity_reservation_group_id = dnp.value.capacity_reservation_group_id
      custom_ca_trust_enabled       = dnp.value.custom_ca_trust_enabled
      enable_auto_scaling           = dnp.value.enable_auto_scaling
      enable_host_encryption        = dnp.value.enable_host_encryption
      enable_node_public_ip         = dnp.value.enable_node_public_ip
      gpu_instance                  = dnp.value.gpu_instance
      host_group_id                 = dnp.value.host_group_id
      dynamic "kubelet_config" {
        iterator = kc
        for_each = dnp.value.kubelet_config

        content {
          allowed_unsafe_sysctls    = kc.value.allowed_unsafe_sysctls
          container_log_max_line    = kc.value.container_log_max_line
          container_log_max_size_mb = kc.value.container_log_max_size_mb
          cpu_cfs_quota_enabled     = kc.value.cpu_cfs_quota_enabled
          cpu_cfs_quota_period      = kc.value.cpu_cfs_quota_period
          cpu_manager_policy        = kc.value.cpu_manager_policy
          image_gc_high_threshold   = kc.value.image_gc_high_threshold
          image_gc_low_threshold    = kc.value.image_gc_low_threshold
          pod_max_pid               = kc.value.pod_max_pid
          topology_manager_policy   = kc.value.topology_manager_policy
        }
      }
      dynamic "linux_os_config" {
        iterator = loc
        for_each = dnp.value.linux_os_config

        content {
          swap_file_size_mb = loc.value.swap_file_size_mb
          dynamic "sysctl_config" {
            iterator = sc
            for_each = loc.value.sysctl_config
            content {
              fs_aio_max_nr                      = sc.value.fs_aio_max_nr
              fs_file_max                        = sc.value.fs_file_max
              fs_inotify_max_user_watches        = sc.value.fs_inotify_max_user_watches
              fs_nr_open                         = sc.value.fs_nr_open
              kernel_threads_max                 = sc.value.kernel_threads_max
              net_core_netdev_max_backlog        = sc.value.net_core_netdev_max_backlog
              net_core_optmem_max                = sc.value.net_core_optmem_max
              net_core_rmem_default              = sc.value.net_core_rmem_default
              net_core_rmem_max                  = sc.value.net_core_rmem_max
              net_core_somaxconn                 = sc.value.net_core_somaxconn
              net_core_wmem_default              = sc.value.net_core_wmem_default
              net_core_wmem_max                  = sc.value.net_core_wmem_max
              net_ipv4_ip_local_port_range_max   = sc.value.net_ipv4_ip_local_port_range_max
              net_ipv4_ip_local_port_range_min   = sc.value.net_ipv4_ip_local_port_range_min
              net_ipv4_neigh_default_gc_thresh1  = sc.value.net_ipv4_neigh_default_gc_thresh1
              net_ipv4_neigh_default_gc_thresh2  = sc.value.net_ipv4_neigh_default_gc_thresh2
              net_ipv4_neigh_default_gc_thresh3  = sc.value.net_ipv4_neigh_default_gc_thresh3
              net_ipv4_tcp_fin_timeout           = sc.value.net_ipv4_tcp_fin_timeout
              net_ipv4_tcp_keepalive_intvl       = sc.value.net_ipv4_tcp_keepalive_intvl
              net_ipv4_tcp_keepalive_probes      = sc.value.net_ipv4_tcp_keepalive_probes
              net_ipv4_tcp_keepalive_time        = sc.value.net_ipv4_tcp_keepalive_time
              net_ipv4_tcp_max_syn_backlog       = sc.value.net_ipv4_tcp_max_syn_backlog
              net_ipv4_tcp_max_tw_buckets        = sc.value.net_ipv4_tcp_max_tw_buckets
              net_ipv4_tcp_tw_reuse              = sc.value.net_ipv4_tcp_tw_reuse
              net_netfilter_nf_conntrack_buckets = sc.value.net_netfilter_nf_conntrack_buckets
              net_netfilter_nf_conntrack_max     = sc.value.net_netfilter_nf_conntrack_max
              vm_max_map_count                   = sc.value.vm_max_map_count
              vm_swappiness                      = sc.value.vm_swappiness
              vm_vfs_cache_pressure              = sc.value.vm_vfs_cache_pressure
            }
          }
          transparent_huge_page_defrag  = loc.value.transparent_huge_page_defrag
          transparent_huge_page_enabled = loc.value.transparent_huge_page_enabled
        }
      }
      fips_enabled       = dnp.value.fips_enabled
      kubelet_disk_type  = dnp.value.kubelet_disk_type
      max_pods           = dnp.value.max_pods
      message_of_the_day = dnp.value.message_of_the_day
      dynamic "node_network_profile" {
        iterator = nnp
        for_each = dnp.value.node_network_profile
        content {
          dynamic "allowed_host_ports" {
            iterator = ahp
            for_each = nnp.value.allowed_host_ports
            content {
              port_start = ahp.value.port_start
              port_end   = ahp.value.port_end
              protocol   = ahp.value.protocol
            }
          }
          application_security_group_ids = nnp.value.application_security_group_ids
          # This requires that the Preview Feature Microsoft.ContainerService/NodePublicIPTagsPreview is enabled and the Resource Provider is re-registered.
          node_public_ip_tags = nnp.value.node_public_ip_tags
        }
      }
      node_public_ip_prefix_id     = dnp.value.node_public_ip_prefix_id
      node_labels                  = dnp.value.node_labels
      only_critical_addons_enabled = dnp.value.only_critical_addons_enabled
      orchestrator_version         = dnp.value.orchestrator_version
      os_disk_size_gb              = dnp.value.os_disk_size_gb
      os_disk_type                 = dnp.value.os_disk_type
      os_sku                       = dnp.value.os_sku
      pod_subnet_id                = dnp.value.pod_subnet_id
      proximity_placement_group_id = dnp.value.proximity_placement_group_id
      scale_down_mode              = dnp.value.scale_down_mode
      snapshot_id                  = dnp.value.snapshot_id
      temporary_name_for_rotation  = dnp.value.temporary_name_for_rotation
      type                         = dnp.value.type
      # At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you may wish to use Terraform's ignore_changes functionality to ignore changes to the casing until this is fixed in the AKS API.
      tags              = dnp.value.tags
      ultra_ssd_enabled = dnp.value.ultra_ssd_enabled
      dynamic "upgrade_settings" {
        iterator = us
        for_each = dnp.value.upgrade_settings
        content {
          max_surge = us.value.max_surge # Required
        }
      }
      vnet_subnet_id   = dnp.value.vnet_subnet_id
      workload_runtime = dnp.value.workload_runtime
      zones            = dnp.value.zones
      # If enable_auto_scaling is set to true, then the following fields can also be configured:
      # If specified you may wish to use Terraform's ignore_changes functionality to ignore changes to this field.
      max_count  = dnp.value.max_count
      min_count  = dnp.value.min_count
      node_count = dnp.value.node_count
    }
  }

  dynamic "aci_connector_linux" {
    iterator = acl
    for_each = each.value.aci_connector_linux

    content {
      subnet_name = acl.value.subnet_name # Required
    }
  }

  dynamic "api_server_access_profile" {
    # This requires that the Preview Feature Microsoft.ContainerService/EnableAPIServerVnetIntegrationPreview is enabled and the Resource Provider is re-registered.
    iterator = asap
    for_each = each.value.api_server_access_profile

    content {
      authorized_ip_ranges     = asap.value.authorized_ip_ranges
      subnet_id                = asap.value.subnet_id
      vnet_integration_enabled = asap.value.vnet_integration_enabled
    }
  }

  dynamic "auto_scaler_profile" {
    iterator = asp
    for_each = each.value.auto_scaler_profile

    content {
      balance_similar_node_groups      = asp.value.balance_similar_node_groups
      expander                         = asp.value.expander
      max_graceful_termination_sec     = asp.value.max_graceful_termination_sec
      max_node_provisioning_time       = asp.value.max_node_provisioning_time
      max_unready_nodes                = asp.value.max_unready_nodes
      max_unready_percentage           = asp.value.max_unready_percentage
      new_pod_scale_up_delay           = asp.value.new_pod_scale_up_delay
      scale_down_delay_after_add       = asp.value.scale_down_delay_after_add
      scale_down_delay_after_delete    = asp.value.scale_down_delay_after_delete
      scale_down_delay_after_failure   = asp.value.scale_down_delay_after_failure
      scan_interval                    = asp.value.scan_interval
      scale_down_unneeded              = asp.value.scale_down_unneeded
      scale_down_unready               = asp.value.scale_down_unready
      scale_down_utilization_threshold = asp.value.scale_down_utilization_threshold
      empty_bulk_delete_max            = asp.value.empty_bulk_delete_max
      skip_nodes_with_local_storage    = asp.value.skip_nodes_with_local_storage
      skip_nodes_with_system_pods      = asp.value.skip_nodes_with_system_pods
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    iterator = aadrbac
    for_each = each.value.azure_active_directory_role_based_access_control

    content {
      managed                = aadrbac.value.managed
      tenant_id              = aadrbac.value.tenant_id
      admin_group_object_ids = aadrbac.value.admin_group_object_ids
      azure_rbac_enabled     = aadrbac.value.azure_rbac_enabled
    }
  }

  dynamic "confidential_computing" {
    iterator = cc
    for_each = each.value.confidential_computing

    content {
      sgx_quote_helper_enabled = cc.value.sgx_quote_helper_enabled # Required
    }
  }

  dynamic "storage_profile" {
    iterator = sp
    for_each = each.value.storage_profile

    content {
      blob_driver_enabled = sp.value.blob_driver_enabled
      disk_driver_enabled = sp.value.disk_driver_enabled
      disk_driver_version = sp.value.disk_driver_version
    }
  }

  dynamic "http_proxy_config" {
    iterator = hpc
    for_each = each.value.http_proxy_config

    content {
      http_proxy  = hpc.value.http_proxy
      https_proxy = hpc.value.https_proxy
      no_proxy    = hpc.value.no_proxy
    }
  }

  dynamic "identity" {
    iterator = i
    for_each = each.value.identity

    content {
      type         = i.value.type # Required
      identity_ids = i.value.identity_ids
    }

  }

  dynamic "ingress_application_gateway" {
    iterator = iag
    for_each = each.value.ingress_application_gateway

    content {
      # Exactly one of gateway_id, subnet_id or subnet_cidr must be specified.
      gateway_id   = iag.value.gateway_id
      gateway_name = iag.value.gateway_name
      subnet_cidr  = iag.value.subnet_cidr
      subnet_id    = iag.value.subnet_id
    }
  }

  dynamic "key_management_service" {
    iterator = kms
    for_each = each.value.key_management_service

    content {
      key_vault_key_id         = kms.value.key_vault_key_id # Required
      key_vault_network_access = kms.value.key_vault_network_access
    }
  }

  dynamic "key_vault_secrets_provider" {
    iterator = kvsp
    for_each = each.value.key_vault_secrets_provider

    content {
      secret_rotation_enabled  = kvsp.value.secret_rotation_enabled
      secret_rotation_interval = kvsp.value.secret_rotation_interval
    }
  }

  dynamic "kubelet_identity" {
    iterator = ki
    for_each = each.value.kubelet_identity

    content {
      client_id                 = ki.value.client_id
      object_id                 = ki.value.object_id
      user_assigned_identity_id = ki.value.user_assigned_identity_id
    }
  }

  dynamic "linux_profile" {
    iterator = lp
    for_each = each.value.linux_profile

    content {
      admin_username = lp.value.admin_username # Required
      dynamic "ssh_key" {                      # Required
        iterator = sk
        for_each = lp.value.ssh_key

        content {
          key_data = sk.value.key_data # Required
        }
      }
    }
  }

  dynamic "maintenance_window" {
    iterator = mw
    for_each = each.value.maintenance_window

    content {
      dynamic "allowed" {
        iterator = a
        for_each = mw.value.allowed

        content {
          day   = a.value.day   # Required
          hours = a.value.hours # Required
        }
      }
      dynamic "not_allowed" {
        iterator = na
        for_each = mw.value.not_allowed

        content {
          end   = na.value.end   # Required
          start = na.value.start # Required
        }
      }
    }
  }

  dynamic "maintenance_window_auto_upgrade" {
    iterator = mwau
    for_each = each.value.maintenance_window_auto_upgrade

    content {
      frequency    = mwau.value.frequency # Required
      interval     = mwau.value.interval  # Required
      duration     = mwau.value.duration  # Required
      day_of_week  = mwau.value.day_of_week
      day_of_month = mwau.value.day_of_month
      week_index   = mwau.value.week_index
      start_time   = mwau.value.start_time
      utc_offset   = mwau.value.utc_offset
      start_date   = mwau.value.start_date
      dynamic "not_allowed" {
        iterator = na
        for_each = mwau.value.not_allowed

        content {
          end   = na.value.end   # Required
          start = na.value.start # Required
        }
      }
    }
  }

  dynamic "maintenance_window_node_os" {
    iterator = mwno
    for_each = each.value.maintenance_window_node_os

    content {
      frequency    = mwno.value.frequency # Required
      interval     = mwno.value.interval  # Required
      duration     = mwno.value.duration  # Required
      day_of_week  = mwno.value.day_of_week
      day_of_month = mwno.value.day_of_month
      week_index   = mwno.value.week_index
      start_time   = mwno.value.start_time
      utc_offset   = mwno.value.utc_offset
      start_date   = mwno.value.start_date
      dynamic "not_allowed" {
        iterator = na
        for_each = mwno.value.not_allowed

        content {
          end   = na.value.end   # Required
          start = na.value.start # Required
        }
      }
    }
  }

  dynamic "microsoft_defender" {
    iterator = md
    for_each = each.value.microsoft_defender

    content {
      log_analytics_workspace_id = md.value.log_analytics_workspace_id # Required
    }
  }

  dynamic "monitor_metrics" {
    iterator = mm
    for_each = each.value.monitor_metrics

    content {
      annotations_allowed = mm.value.annotations_allowed
      labels_allowed      = mm.value.labels_allowed
    }
  }

  dynamic "network_profile" {
    iterator = np
    for_each = each.value.network_profile

    content {
      network_plugin = np.value.network_plugin # Required
      network_mode   = np.value.network_mode
      network_policy = np.value.network_policy
      dns_service_ip = np.value.dns_service_ip
      # docker_bridge_cidr = np.value.docker_bridge_cidr # has been deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
      ebpf_data_plane     = np.value.ebpf_data_plane
      network_plugin_mode = np.value.network_plugin_mode
      outbound_type       = np.value.outbound_type
      pod_cidr            = np.value.pod_cidr
      pod_cidrs           = np.value.pod_cidrs
      service_cidr        = np.value.service_cidr
      service_cidrs       = np.value.service_cidrs
      ip_versions         = np.value.ip_versions
      load_balancer_sku   = np.value.load_balancer_sku
      dynamic "load_balancer_profile" {
        iterator = lbp
        for_each = np.value.load_balancer_profile

        content {
          idle_timeout_in_minutes     = lbp.value.idle_timeout_in_minutes
          managed_outbound_ip_count   = lbp.value.managed_outbound_ip_count
          managed_outbound_ipv6_count = lbp.value.managed_outbound_ipv6_count
          outbound_ip_address_ids     = lbp.value.outbound_ip_address_ids
          outbound_ip_prefix_ids      = lbp.value.outbound_ip_prefix_ids
          outbound_ports_allocated    = lbp.value.outbound_ports_allocated
        }
      }
      dynamic "nat_gateway_profile" {
        iterator = ngp
        for_each = np.value.nat_gateway_profile

        content {
          idle_timeout_in_minutes   = ngp.value.idle_timeout_in_minutes
          managed_outbound_ip_count = ngp.value.managed_outbound_ip_count
        }
      }
    }
  }

  dynamic "oms_agent" {
    iterator = oa
    for_each = each.value.oms_agent

    content {
      log_analytics_workspace_id      = oa.value.log_analytics_workspace_id # Required
      msi_auth_for_monitoring_enabled = oa.value.msi_auth_for_monitoring_enabled
    }
  }

  # This requires that the Preview Feature Microsoft.ContainerService/AzureServiceMeshPreview is enabled and the Resource Provider is re-registered.
  dynamic "service_mesh_profile" {
    iterator = smp
    for_each = each.value.service_mesh_profile

    content {
      mode                             = smp.value.mode # Required
      internal_ingress_gateway_enabled = smp.value.internal_ingress_gateway_enabled
      external_ingress_gateway_enabled = smp.value.external_ingress_gateway_enabled
    }
  }

  dynamic "workload_autoscaler_profile" {
    iterator = wap
    for_each = each.value.workload_autoscaler_profile

    content {
      keda_enabled                    = wap.value.keda_enabled
      vertical_pod_autoscaler_enabled = wap.value.vertical_pod_autoscaler_enabled
    }
  }

  dynamic "service_principal" {
    iterator = sepr
    for_each = each.value.service_principal

    content {
      client_id     = sepr.value.client_id     # Required
      client_secret = sepr.value.client_secret # Required, wrap the input into the sensitive() function.
    }
  }

  dynamic "web_app_routing" {
    iterator = war
    for_each = each.value.web_app_routing

    content {
      dns_zone_id = war.value.dns_zone_id # Required
    }
  }

  dynamic "windows_profile" {
    iterator = wp
    for_each = each.value.windows_profile

    content {
      admin_username = wp.value.admin_username
      admin_password = wp.value.admin_password # Wrap the input into the sensitive() function.
      license        = wp.value.license
      dynamic "gmsa" {
        iterator = g
        for_each = wp.value.gmsa

        content {
          # The properties dns_server and root_domain must both either be set or unset, i.e. empty.
          dns_server  = g.value.dns_server  # Required
          root_domain = g.value.root_domain # Required
        }
      }
    }
  }
}
