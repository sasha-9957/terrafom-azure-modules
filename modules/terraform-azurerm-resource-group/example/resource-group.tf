provider "azurerm" {
  features {}
}

module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_name01 = {
      name          = local.name
      prefixes      = local.prefixes
      suffixes      = local.suffixes
      random_length = local.random_length
      random_seed   = null
      resource_type = local.resource_type
      separator     = null
      clean_input   = local.clean_input
      passthrough   = null
      use_slug      = null
    }
  }
}

module "tags" {
  source = "app.terraform.io/captionhealth/tags/azurerm"

  tags_params = {
    Application          = local.Application
    Application_Name     = local.Application_Name
    Application_Owner    = local.Application_Owner
    Application_Type     = local.Application_Type
    Business_Criticality = local.Business_Criticality
    Created_On_Date      = local.Created_On_Date
    DR_Tag               = local.DR_Tag
    Data_Classification  = local.Data_Classification
    Deployed_By          = local.Deployed_By
    Environment          = local.Environment
    Managed_By           = local.Managed_By
    Purpose              = local.Purpose
    SLA_Tier             = local.SLA_Tier
    Status               = local.Status
    Take_On_Stream       = local.Take_On_Stream
  }
}

module "resource_group" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  resource_group_params = {
    resource_group1 = {
      location   = local.location
      name       = module.name.azurecaf_names["azurecaf_name01"].result
      managed_by = null
      tags       = module.tags.tags
    }
  }
}
