module "resource_group" {
  source = "../../modules/terraform-azurerm-resource-group"

  resource_group_params = {
    main_rg = {
      location   = local.location
      name       = module.name.names["main_rg"].result
      managed_by = null
      tags       = module.tags.tags
    }
    dwh_rg = {
      location   = local.location
      name       = module.name.names["dwh_rg"].result
      managed_by = null
      tags       = module.tags.tags
    }
  }
}
