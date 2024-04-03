module "kubernetes_cluster" {
  source  = "app.terraform.io/HHCompany/kubernetes-cluster/azurerm"
  version = "1.0.0"

  azurerm_kubernetes_cluster_params = {
    main_aks = {
      name                = module.name.names["main_aks"].result                      # Required
      location            = module.resource_group.resource_groups["main_rg"].location # Required
      resource_group_name = module.resource_group.resource_groups["main_rg"].name     # Required
      # You must define either a dns_prefix or a dns_prefix_private_cluster field.
      dns_prefix                          = "hhaks"
      dns_prefix_private_cluster          = null
      automatic_channel_upgrade           = null
      azure_policy_enabled                = null
      custom_ca_trust_certificates_base64 = null
      disk_encryption_set_id              = null
      edge_zone                           = null
      http_application_routing_enabled    = null
      image_cleaner_enabled               = null
      image_cleaner_interval_hours        = null
      kubernetes_version                  = null
      local_account_disabled              = null
      # This requires that the Preview Feature Microsoft.ContainerService/NodeOsUpgradeChannelPreview is enabled and the Resource Provider is re-registered.
      node_os_channel_upgrade = null
      # Azure requires that a new, non-existent Resource Group is used, as otherwise, the provisioning of the Kubernetes Service will fail.
      node_resource_group                 = null
      oidc_issuer_enabled                 = null
      open_service_mesh_enabled           = null
      private_cluster_enabled             = null
      private_dns_zone_id                 = null
      private_cluster_public_fqdn_enabled = null
      workload_identity_enabled           = null
      # This is currently not functional and is not passed to the Azure API. For controlling the public and private exposure of a cluster please see the properties private_cluster_enabled and api_server_access_profile.
      # public_network_access_enabled     = null
      role_based_access_control_enabled = null
      run_command_enabled               = null
      sku_tier                          = null
      support_plan                      = null
      tags                              = null

      default_node_pool = [
        {
          name                          = "default"        # Required
          vm_size                       = "Standard_D2_v2" # Required
          capacity_reservation_group_id = null
          custom_ca_trust_enabled       = null
          enable_auto_scaling           = null
          enable_host_encryption        = null
          enable_node_public_ip         = null
          gpu_instance                  = null
          host_group_id                 = null
          fips_enabled                  = null
          kubelet_disk_type             = null
          max_pods                      = null
          message_of_the_day            = null
          node_public_ip_prefix_id      = null
          node_labels                   = null
          only_critical_addons_enabled  = null
          orchestrator_version          = null
          os_disk_size_gb               = null
          os_disk_type                  = null
          os_sku                        = null
          pod_subnet_id                 = null
          proximity_placement_group_id  = null
          scale_down_mode               = null
          snapshot_id                   = null
          temporary_name_for_rotation   = "tempnodepool"
          type                          = null
          # At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you may wish to use Terraform's ignore_changes functionality to ignore changes to the casing until this is fixed in the AKS API.
          tags              = null
          ultra_ssd_enabled = null
          vnet_subnet_id    = null
          workload_runtime  = null
          zones             = null
          # If enable_auto_scaling is set to true, then the following fields can also be configured:
          # If specified you may wish to use Terraform's ignore_changes functionality to ignore changes to this field.
          max_count  = null
          min_count  = null
          node_count = 1

          kubelet_config = [
            {
              allowed_unsafe_sysctls    = null
              container_log_max_line    = null
              container_log_max_size_mb = null
              cpu_cfs_quota_enabled     = null
              cpu_cfs_quota_period      = null
              cpu_manager_policy        = null
              image_gc_high_threshold   = null
              image_gc_low_threshold    = null
              pod_max_pid               = null
              topology_manager_policy   = null
            }
          ]

          linux_os_config = [
            #   {
            #     swap_file_size_mb             = null
            #     transparent_huge_page_defrag  = null
            #     transparent_huge_page_enabled = null
            #     sysctl_config = [
            #       {
            #         fs_aio_max_nr                      = null
            #         fs_file_max                        = null
            #         fs_inotify_max_user_watches        = null
            #         fs_nr_open                         = null
            #         kernel_threads_max                 = null
            #         net_core_netdev_max_backlog        = null
            #         net_core_optmem_max                = null
            #         net_core_rmem_default              = null
            #         net_core_rmem_max                  = null
            #         net_core_somaxconn                 = null
            #         net_core_wmem_default              = null
            #         net_core_wmem_max                  = null
            #         net_ipv4_ip_local_port_range_max   = null
            #         net_ipv4_ip_local_port_range_min   = null
            #         net_ipv4_neigh_default_gc_thresh1  = null
            #         net_ipv4_neigh_default_gc_thresh2  = null
            #         net_ipv4_neigh_default_gc_thresh3  = null
            #         net_ipv4_tcp_fin_timeout           = null
            #         net_ipv4_tcp_keepalive_intvl       = null
            #         net_ipv4_tcp_keepalive_probes      = null
            #         net_ipv4_tcp_keepalive_time        = null
            #         net_ipv4_tcp_max_syn_backlog       = null
            #         net_ipv4_tcp_max_tw_buckets        = null
            #         net_ipv4_tcp_tw_reuse              = null
            #         net_netfilter_nf_conntrack_buckets = null
            #         net_netfilter_nf_conntrack_max     = null
            #         vm_max_map_count                   = null
            #         vm_swappiness                      = null
            #         vm_vfs_cache_pressure              = null
            #       }
            #     ]
            #   }
          ]

          node_network_profile = [
            #   {
            #     application_security_group_ids = null
            #     # This requires that the Preview Feature Microsoft.ContainerService/NodePublicIPTagsPreview is enabled and the Resource Provider is re-registered.
            #     node_public_ip_tags = null

            #     allowed_host_ports = [
            #       {
            #         port_start = null
            #         port_end   = null
            #         protocol   = null
            #       }
            #     ]
            #   }
          ]

          upgrade_settings = [
            #   {
            #     max_surge = null # Required
            #   }
          ]
        }
      ]

      # aci_connector_linux = [
      #   {
      #     subnet_name = null # Required
      #   }
      # ]
      aci_connector_linux = []

      # This requires that the Preview Feature Microsoft.ContainerService/EnableAPIServerVnetIntegrationPreview is enabled and the Resource Provider is re-registered.
      api_server_access_profile = [
        #   {
        #     authorized_ip_ranges     = null
        #     subnet_id                = null
        #     vnet_integration_enabled = null
        #   }
      ]

      auto_scaler_profile = [
        # {
        #   balance_similar_node_groups      = null
        #   expander                         = null
        #   max_graceful_termination_sec     = null
        #   max_node_provisioning_time       = null
        #   max_unready_nodes                = null
        #   max_unready_percentage           = null
        #   new_pod_scale_up_delay           = null
        #   scale_down_delay_after_add       = null
        #   scale_down_delay_after_delete    = null
        #   scale_down_delay_after_failure   = null
        #   scan_interval                    = null
        #   scale_down_unneeded              = null
        #   scale_down_unready               = null
        #   scale_down_utilization_threshold = null
        #   empty_bulk_delete_max            = null
        #   skip_nodes_with_local_storage    = null
        #   skip_nodes_with_system_pods      = null
        # }
      ]

      azure_active_directory_role_based_access_control = [
        #   {
        #     managed                = null
        #     tenant_id              = null
        #     admin_group_object_ids = null
        #     azure_rbac_enabled     = null
        #   }
      ]

      confidential_computing = [
        #   {
        #     sgx_quote_helper_enabled = null # Required
        #   }
      ]

      storage_profile = [
        # {
        #   blob_driver_enabled = null
        #   disk_driver_enabled = null
        #   disk_driver_version = null
        # }
      ]

      http_proxy_config = [
        #   {
        #     http_proxy  = null
        #     https_proxy = null
        #     no_proxy    = null
        #   }
      ]

      identity = [
        {
          type         = "SystemAssigned" # Required
          identity_ids = null
        }
      ]

      ingress_application_gateway = [
        #   {
        #     # Exactly one of gateway_id, subnet_id or subnet_cidr must be specified.
        #     gateway_id   = null
        #     gateway_name = null
        #     subnet_cidr  = null
        #     subnet_id    = null
        #   }
      ]

      key_management_service = [
        #   {
        #     key_vault_key_id         = null # Required
        #     key_vault_network_access = null
        #   }
      ]

      key_vault_secrets_provider = [
        {
          secret_rotation_enabled  = true
          secret_rotation_interval = null
        }
      ]

      kubelet_identity = [
        # {
        #   client_id                 = null
        #   object_id                 = null
        #   user_assigned_identity_id = null
        # }
      ]

      linux_profile = [
        #   {
        #     admin_username = null # Required
        #     ssh_key = [           # Required
        #       {
        #         key_data = null # Required
        #       }
        #     ]
        #   }
      ]

      maintenance_window = [
        #   {
        #     allowed = [
        #       {
        #         day   = null # Required
        #         hours = null # Required
        #       }
        #     ]
        #     not_allowed = [
        #       {
        #         end   = null # Required
        #         start = null # Required
        #       }
        #     ]
        #   }
      ]

      maintenance_window_auto_upgrade = [
        #   {
        #     frequency    = null # Required
        #     interval     = null # Required
        #     duration     = null # Required
        #     day_of_week  = null
        #     day_of_month = null
        #     week_index   = null
        #     start_time   = null
        #     utc_offset   = null
        #     start_date   = null

        #     not_allowed = [
        #       {
        #         end   = null # Required
        #         start = null # Required
        #       }
        #     ]
        #   }
      ]

      maintenance_window_node_os = [
        #   {
        #     frequency    = null # Required
        #     interval     = null # Required
        #     duration     = null # Required
        #     day_of_week  = null
        #     day_of_month = null
        #     week_index   = null
        #     start_time   = null
        #     utc_offset   = null
        #     start_date   = null

        #     not_allowed = [
        #       {
        #         end   = null # Required
        #         start = null # Required
        #       }
        #     ]
        #   }
      ]

      microsoft_defender = [
        #   {
        #     log_analytics_workspace_id = null # Required
        #   }
      ]

      monitor_metrics = [
        # {
        #   annotations_allowed = null
        #   labels_allowed      = null
        # }
      ]

      network_profile = [
        #   {
        #     network_plugin = null # Required
        #     network_mode   = null
        #     network_policy = null
        #     dns_service_ip = null
        #     # docker_bridge_cidr = null # has been deprecated as the API no longer supports it and will be removed in version 4.0 of the provider.
        #     ebpf_data_plane     = null
        #     network_plugin_mode = null
        #     outbound_type       = null
        #     pod_cidr            = null
        #     pod_cidrs           = null
        #     service_cidr        = null
        #     service_cidrs       = null
        #     ip_versions         = null
        #     load_balancer_sku   = null

        #     load_balancer_profile = [
        #       {
        #         idle_timeout_in_minutes     = null
        #         managed_outbound_ip_count   = null
        #         managed_outbound_ipv6_count = null
        #         outbound_ip_address_ids     = null
        #         outbound_ip_prefix_ids      = null
        #         outbound_ports_allocated    = null
        #       }
        #     ]

        #     nat_gateway_profile = [
        #       {
        #         idle_timeout_in_minutes   = null
        #         managed_outbound_ip_count = null
        #       }
        #     ]
        #   }
      ]

      oms_agent = [
        #   {
        #     log_analytics_workspace_id      = null # Required
        #     msi_auth_for_monitoring_enabled = null
        #   }
      ]

      # This requires that the Preview Feature Microsoft.ContainerService/AzureServiceMeshPreview is enabled and the Resource Provider is re-registered.
      service_mesh_profile = [
        #   {
        #     mode                             = null # Required
        #     internal_ingress_gateway_enabled = null
        #     external_ingress_gateway_enabled = null
        #   }
      ]

      workload_autoscaler_profile = [
        #   {
        #     keda_enabled                    = null
        #     vertical_pod_autoscaler_enabled = null
        #   }
      ]

      service_principal = [
        #   {
        #     client_id     = null # Required
        #     client_secret = null # Required, wrap the input into the sensitive() function.
        #   }
      ]

      web_app_routing = [
        #   {
        #     dns_zone_id = null # Required
        #   }
      ]

      windows_profile = [
        #   {
        #     admin_username = null
        #     admin_password = null # Wrap the input into the sensitive() function.
        #     license        = null

        #     # gmsa = [
        #     #   {
        #     #     # The properties dns_server and root_domain must both either be set or unset, i.e. empty.
        #     #     dns_server  = null # Required
        #     #     root_domain = null # Required
        #     #   }
        #     # ]
        #   }
      ]
    }
  }
}
