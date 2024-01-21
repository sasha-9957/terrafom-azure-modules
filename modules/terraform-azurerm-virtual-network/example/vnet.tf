provider "azurerm" {
  features {}
}

module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_rg_name = {
      name          = "example"
      prefixes      = ["hh"]
      suffixes      = ["centralus"]
      random_length = 2
      random_seed   = null
      resource_type = "azurerm_resource_group"
      separator     = null
      clean_input   = true
      passthrough   = null
      use_slug      = null
    }
    azurecaf_vnet_name = {
      name          = "main"
      prefixes      = ["hh"]
      suffixes      = ["centralus"]
      random_length = 2
      random_seed   = null
      resource_type = "azurerm_virtual_network"
      separator     = null
      clean_input   = true
      passthrough   = null
      use_slug      = null
    }
  }
}

module "tags" {
  source = "app.terraform.io/captionhealth/tags/azurerm"

  tags_params = {
    Application          = "Test"
    Application_Name     = "Test"
    Application_Owner    = "devops@captionhealth.com"
    Application_Type     = "paas"
    Business_Criticality = "nobc"
    Created_On_Date      = timestamp()
    DR_Tag               = "nodr"
    Data_Classification  = "internal"
    Deployed_By          = "devops@captionhealth.com"
    Environment          = "test"
    Managed_By           = "captionhealth"
    Purpose              = "Testing"
    SLA_Tier             = "nosla"
    Status               = "test"
    Take_On_Stream       = "n/a"
  }
}

module "resource_group" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  resource_group_params = {
    resource_group1 = {
      location   = "centralus"
      name       = module.name.azurecaf_names["azurecaf_rg_name"].result
      managed_by = null
      tags       = module.tags.tags
    }
  }
}

module "virtual_network" {
  source = "app.terraform.io/captionhealth/virtual-network/azurerm"

  azurerm_virtual_network_params = {
    vnet1 = {
      name                = module.name.azurecaf_names["azurecaf_vnet_name"].result           # required
      resource_group_name = module.resource_group.resource_groups["resource_group1"].name     # required
      address_space       = ["10.0.0.0/16"]                                                   # required
      location            = module.resource_group.resource_groups["resource_group1"].location # required
      bgp_community       = null
      ddos_protection_plan = [
        # {
        #   id     = null
        #   enable = null
        # }
      ]

      encryption = [
        # {
        #   enforcement = null # required
        # }
      ]
      dns_servers             = []
      edge_zone               = null
      flow_timeout_in_minutes = null
      subnet = [
        {
          name           = "subnet1"     # required
          address_prefix = "10.0.1.0/24" # required
          security_group = null
        },
        {
          name           = "subnet2"     # required
          address_prefix = "10.0.2.0/24" # required
          security_group = null
        }
      ]

      tags = module.tags.tags
    }
  }
}
