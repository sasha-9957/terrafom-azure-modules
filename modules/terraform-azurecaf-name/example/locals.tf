locals {
  name          = "infra"
  resource_type = "azurerm_resource_group"
  prefixes      = ["contoso"]
  suffixes      = ["eastus"]
  random_length = 2
  clean_input   = true
}
