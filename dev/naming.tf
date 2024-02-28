module "name" {
  source = "../modules/terraform-azurecaf-name"

  azurecaf_name_params = {
    main_rg = {
      name           = "dev"
      prefixes       = ["ch"]
      suffixes       = ["eastus"]
      random_length  = 3
      resource_type  = "azurerm_resource_group"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null
    }


    main_log_analytics_workspace = {
      name           = "dev"
      prefixes       = ["ch"]
      suffixes       = ["eastus"]
      random_length  = 3
      resource_type  = "azurerm_log_analytics_workspace"
      resource_types = null
      clean_input    = true
      random_seed    = null
      separator      = null
      passthrough    = null
      use_slug       = null 
    }

#     main_application_insights = {
#       name           = "dev"
#       prefixes       = ["ch"]
#       suffixes       = ["eastus"]
#       random_length  = 3
#       resource_type  = "azurerm_application_insights"
#       resource_types = null
#       clean_input    = true
#       random_seed    = null
#       separator      = null
#       passthrough    = null
#       use_slug       = null
#     }
   
#     main_azurerm_lb = {
#       name           = "dev"
#       prefixes       = ["ch"]
#       suffixes       = ["eastus"]
#       random_length  = 3
#       resource_type  = "azurerm_lb"
#       resource_types = null
#       clean_input    = true
#       random_seed    = null
#       separator      = null
#       passthrough    = null
#       use_slug       = null
#     }
  }
}