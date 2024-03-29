module "name" {
  source = "../modules/terraform-azurecaf-name"
  for_each             = local.environments

  azurecaf_name_params = {
    main_rg = {
      name           = each.value.name
      prefixes       = [var.prefixes]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_resource_group"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    storage_account1 = {
      name           = var.environment
      prefixes       = [var.prefixes]
      suffixes       = [local.location]
      random_length  = 2
      resource_type  = "azurerm_storage_account"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    main_vnet = {
      name           = var.environment
      prefixes       = [var.prefixes]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_virtual_network"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    linux_subnet = {
      name           = var.environment
      prefixes       = ["${var.prefixes}-lin"]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_subnet"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    application_insights1 = {
      name           = var.environment
      prefixes       = ["${var.prefixes}-lin"]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_application_insights"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }

    key_vault1 = {
      name           = var.environment
      prefixes       = [var.prefixes]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_key_vault"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    storage_container = {
      name           = var.environment
      prefixes       = [var.prefixes]
      suffixes       = [local.location]
      random_length  = 3
      resource_type  = "azurerm_storage_container"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
  }
}
