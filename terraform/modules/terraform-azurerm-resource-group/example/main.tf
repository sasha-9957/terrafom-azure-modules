module "resource_group" {
  source  = "app.terraform.io/captionhealth/resource-group/azurerm"
  version = "1.0.0"

  resource_group_params = {
    main_rg = {
      location   = "eastus"                            # required
      name       = module.name.names["main_rg"].result # required
      managed_by = null
      tags       = null
    }
  }
}
