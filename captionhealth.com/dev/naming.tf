# {env}-{stamp/global}-{caf}-{region}-{rand}-{optional}

module "name" {
  source = "../../modules/terraform-azurecaf-name"

  azurecaf_name_params = {
    main_rg = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_resource_group"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_rg = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_resource_group"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    public_ip1 = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_public_ip"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_load_balancer = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_lb"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_private_link_service = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_private_link_service"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_private_endpoint = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_private_endpoint"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_service_connection = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_private_service_connection"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_vnet = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_virtual_network"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_vnet = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_virtual_network"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    subnet1 = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_subnet"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    subnet2 = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_subnet"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_linux_subnet = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_subnet"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_storage_account = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_storage_account"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_storage_account = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_storage_account"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_storage_container = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_storage_container"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_blob_storage = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_storage_blob"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_key_vault = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_key_vault"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    dwh_app_insights = {
      name           = "eastus"
      prefixes       = ["dev", "stamp"]
      suffixes       = null
      random_length  = 3
      resource_type  = "azurerm_application_insights"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
  }
 }
