variable "azurerm_kubernetes_cluster_params" {
  description = "Object map for Azure Kubernetes Cluster module input parameters."
  type = map(object({
    name                                = string # Required
    location                            = string # Required
    resource_group_name                 = string # Required
    dns_prefix                          = string
    dns_prefix_private_cluster          = string
    automatic_channel_upgrade           = string
    azure_policy_enabled                = bool
    custom_ca_trust_certificates_base64 = list(string)
    disk_encryption_set_id              = string
    edge_zone                           = string
    http_application_routing_enabled    = bool
    image_cleaner_enabled               = bool
    image_cleaner_interval_hours        = number
    kubernetes_version                  = string
    local_account_disabled              = bool
    # This requires that the Preview Feature Microsoft.ContainerService/NodeOsUpgradeChannelPreview is enabled and the Resource Provider is re-registered.
    node_os_channel_upgrade = string
    # Azure requires that a new, non-existent Resource Group is used, as otherwise, the provisioning of the Kubernetes Service will fail.
    node_resource_group                 = string
    oidc_issuer_enabled                 = bool
    open_service_mesh_enabled           = bool
    private_cluster_enabled             = bool
    private_dns_zone_id                 = string
    private_cluster_public_fqdn_enabled = bool
    workload_identity_enabled           = bool
    # This is currently not functional and is not passed to the Azure API. For controlling the public and private exposure of a cluster please see the properties private_cluster_enabled and api_server_access_profile.
    # public_network_access_enabled     = each.value.public_network_access_enabled
    role_based_access_control_enabled = bool
    run_command_enabled               = bool
    sku_tier                          = string
    support_plan                      = string
    tags                              = map(string)
    default_node_pool = list(object({        # Required
      name                          = string # Required
      vm_size                       = string # Required
      capacity_reservation_group_id = string
      custom_ca_trust_enabled       = bool
      enable_auto_scaling           = bool
      enable_host_encryption        = bool
      enable_node_public_ip         = bool
      gpu_instance                  = string
      host_group_id                 = string
      kubelet_config = list(object({
        allowed_unsafe_sysctls    = set(string)
        container_log_max_line    = number
        container_log_max_size_mb = number
        cpu_cfs_quota_enabled     = bool
        cpu_cfs_quota_period      = string
        cpu_manager_policy        = string
        image_gc_high_threshold   = number
        image_gc_low_threshold    = number
        pod_max_pid               = number
        topology_manager_policy   = bool
      }))
      linux_os_config = list(object({
        swap_file_size_mb = number
        sysctl_config = list(object({
          fs_aio_max_nr                      = number
          fs_file_max                        = number
          fs_inotify_max_user_watches        = number
          fs_nr_open                         = number
          kernel_threads_max                 = number
          net_core_netdev_max_backlog        = number
          net_core_optmem_max                = number
          net_core_rmem_default              = number
          net_core_rmem_max                  = number
          net_core_somaxconn                 = number
          net_core_wmem_default              = number
          net_core_wmem_max                  = number
          net_ipv4_ip_local_port_range_max   = number
          net_ipv4_ip_local_port_range_min   = number
          net_ipv4_neigh_default_gc_thresh1  = number
          net_ipv4_neigh_default_gc_thresh2  = number
          net_ipv4_neigh_default_gc_thresh3  = number
          net_ipv4_tcp_fin_timeout           = number
          net_ipv4_tcp_keepalive_intvl       = number
          net_ipv4_tcp_keepalive_probes      = number
          net_ipv4_tcp_keepalive_time        = number
          net_ipv4_tcp_max_syn_backlog       = number
          net_ipv4_tcp_max_tw_buckets        = number
          net_ipv4_tcp_tw_reuse              = bool
          net_netfilter_nf_conntrack_buckets = number
          net_netfilter_nf_conntrack_max     = number
          vm_max_map_count                   = number
          vm_swappiness                      = number
          vm_vfs_cache_pressure              = number
        }))
        transparent_huge_page_defrag  = string
        transparent_huge_page_enabled = string
      }))
      fips_enabled       = bool
      kubelet_disk_type  = string
      max_pods           = number
      message_of_the_day = string
      node_network_profile = list(object({
        allowed_host_ports = list(object({
          port_start = number
          port_end   = number
          protocol   = string
        }))
        application_security_group_ids = list(string)
        # This requires that the Preview Feature Microsoft.ContainerService/NodePublicIPTagsPreview is enabled and the Resource Provider is re-registered.
        node_public_ip_tags = map(string)
      }))
      node_public_ip_prefix_id     = string
      node_labels                  = map(string)
      only_critical_addons_enabled = bool
      orchestrator_version         = string
      os_disk_size_gb              = number
      os_disk_type                 = string
      os_sku                       = string
      pod_subnet_id                = string
      proximity_placement_group_id = string
      scale_down_mode              = string
      snapshot_id                  = string
      temporary_name_for_rotation  = string
      type                         = string
      # At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you may wish to use Terraform's ignore_changes functionality to ignore changes to the casing until this is fixed in the AKS API.
      tags              = map(string)
      ultra_ssd_enabled = bool
      upgrade_settings = list(object({
        max_surge = string # Required
      }))
      vnet_subnet_id   = string
      workload_runtime = string
      zones            = set(string)
      # If enable_auto_scaling is set to true, then the following fields can also be configured:
      # If specified you may wish to use Terraform's ignore_changes functionality to ignore changes to this field.
      max_count  = number
      min_count  = number
      node_count = number
    }))
    aci_connector_linux = list(object({
      subnet_name = string # Required
    }))
    # This requires that the Preview Feature Microsoft.ContainerService/EnableAPIServerVnetIntegrationPreview is enabled and the Resource Provider is re-registered.
    api_server_access_profile = list(object({
      authorized_ip_ranges     = set(string)
      subnet_id                = string
      vnet_integration_enabled = bool
    }))
    auto_scaler_profile = list(object({
      balance_similar_node_groups      = bool
      expander                         = string
      max_graceful_termination_sec     = string
      max_node_provisioning_time       = string
      max_unready_nodes                = number
      max_unready_percentage           = number
      new_pod_scale_up_delay           = string
      scale_down_delay_after_add       = string
      scale_down_delay_after_delete    = string
      scale_down_delay_after_failure   = string
      scan_interval                    = string
      scale_down_unneeded              = string
      scale_down_unready               = string
      scale_down_utilization_threshold = string
      empty_bulk_delete_max            = string
      skip_nodes_with_local_storage    = bool
      skip_nodes_with_system_pods      = bool
    }))
    azure_active_directory_role_based_access_control = list(object({
      managed                = bool
      tenant_id              = string
      admin_group_object_ids = list(string)
      azure_rbac_enabled     = bool
    }))
    confidential_computing = list(object({
      sgx_quote_helper_enabled = bool # Required
    }))
    storage_profile = list(object({
      blob_driver_enabled = bool
      disk_driver_enabled = bool
      disk_driver_version = string
    }))
    http_proxy_config = list(object({
      http_proxy  = string
      https_proxy = string
      no_proxy    = set(string)
    }))
    identity = list(object({
      type         = string # Required
      identity_ids = set(string)
    }))
    ingress_application_gateway = list(object({
      # Exactly one of gateway_id, subnet_id or subnet_cidr must be specified.
      gateway_id   = string
      gateway_name = string
      subnet_cidr  = string
      subnet_id    = string
    }))
    key_management_service = list(object({
      key_vault_key_id         = string # Required
      key_vault_network_access = string
    }))
    key_vault_secrets_provider = list(object({
      secret_rotation_enabled  = bool
      secret_rotation_interval = string
    }))
    kubelet_identity = list(object({
      client_id                 = string
      object_id                 = string
      user_assigned_identity_id = string
    }))
    linux_profile = list(object({
      admin_username = string # Required
      ssh_key = list(object({
        key_data = string # Required
      }))
    }))
    maintenance_window = list(object({
      allowed = list(object({
        day   = string      # Required
        hours = set(number) # Required
      }))
      not_allowed = list(object({
        end   = string # Required
        start = string # Required
      }))
    }))
    maintenance_window_auto_upgrade = list(object({
      frequency    = string # Required
      interval     = number # Required
      duration     = number # Required
      day_of_week  = string
      day_of_month = number
      week_index   = string
      start_time   = string
      utc_offset   = string
      start_date   = string
      not_allowed = list(object({
        end   = string # Required
        start = string # Required
      }))
    }))
    maintenance_window_node_os = list(object({
      frequency    = string # Required
      interval     = number # Required
      duration     = number # Required
      day_of_week  = string
      day_of_month = number
      week_index   = string
      start_time   = string
      utc_offset   = string
      start_date   = string
      not_allowed = list(object({
        end   = string # Required
        start = string # Required
      }))
    }))
    microsoft_defender = list(object({
      log_analytics_workspace_id = string # Required
    }))
    monitor_metrics = list(object({
      annotations_allowed = string
      labels_allowed      = string
    }))
    network_profile = list(object({
      network_plugin = string # Required
      network_mode   = string
      network_policy = string
      dns_service_ip = string
      # docker_bridge_cidr = np.value.docker_bridge_cidr # has been deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
      ebpf_data_plane     = string
      network_plugin_mode = string
      outbound_type       = string
      pod_cidr            = string
      pod_cidrs           = list(string)
      service_cidr        = string
      service_cidrs       = list(string)
      ip_versions         = list(string)
      load_balancer_sku   = string
      load_balancer_profile = list(object({
        idle_timeout_in_minutes     = number
        managed_outbound_ip_count   = number
        managed_outbound_ipv6_count = number
        outbound_ip_address_ids     = set(string)
        outbound_ip_prefix_ids      = set(string)
        outbound_ports_allocated    = number
      }))
      nat_gateway_profile = list(object({
        idle_timeout_in_minutes   = number
        managed_outbound_ip_count = number
      }))
    }))
    oms_agent = list(object({
      log_analytics_workspace_id      = string # Required
      msi_auth_for_monitoring_enabled = bool
    }))
    # This requires that the Preview Feature Microsoft.ContainerService/AzureServiceMeshPreview is enabled and the Resource Provider is re-registered.
    service_mesh_profile = list(object({
      mode                             = string # Required
      internal_ingress_gateway_enabled = bool
      external_ingress_gateway_enabled = bool
    }))
    workload_autoscaler_profile = list(object({
      keda_enabled                    = bool
      vertical_pod_autoscaler_enabled = bool
    }))
    service_principal = list(object({
      client_id     = string # Required
      client_secret = string # Required, wrap the input into the sensitive() function.
    }))
    web_app_routing = list(object({
      dns_zone_id = string # Required
    }))
    windows_profile = list(object({
      admin_username = string
      admin_password = string # Wrap the input into the sensitive() function.
      license        = string
      gmsa = list(object({
        # The properties dns_server and root_domain must both either be set or unset, i.e. empty.
        dns_server  = string # Required
        root_domain = string # Required
      }))
    }))
  }))
}
