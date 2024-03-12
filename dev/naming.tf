module "name" {
  source = "../modules/terraform-azurecaf-name"

  azurecaf_name_params = {
    main_rg = {
      name           = var.environment
      prefixes       = [var.prefixes]
      suffixes       = [var.location]
      random_length  = 3
      resource_type  = "azurerm_resource_group"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }
    # main_vnet = {
    #   name           = var.environment
    #   prefixes       = [var.prefixes]
    #   suffixes       = [var.location]
    #   random_length  = 3
    #   resource_type  = "azurerm_virtual_network"
    #   resource_types = null
    #   clean_input    = true
    #   random_seed    = null
    #   separator      = null
    #   passthrough    = null
    #   use_slug       = null
    # }
    # subnet1 = {
    #   name           = var.environment
    #   prefixes       = ["${var.prefixes}-1"]
    #   suffixes       = [var.location]
    #   random_length  = 3
    #   resource_type  = "azurerm_subnet"
    #   resource_types = null
    #   clean_input    = true
    #   random_seed    = null
    #   separator      = null
    #   passthrough    = null
    #   use_slug       = null
    # }
    # subnet2 = {
    #   name           = var.environment
    #   prefixes       = ["${var.prefixes}-2"]
    #   suffixes       = [var.location]
    #   random_length  = 3
    #   resource_type  = "azurerm_subnet"
    #   resource_types = null
    #   clean_input    = true
    #   random_seed    = null
    #   separator      = null
    #   passthrough    = null
    #   use_slug       = null
    # }
  }
}