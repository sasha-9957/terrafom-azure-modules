module "tags" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  tags_params = {
    managed_by = "terraform"
    dept       = "dev"
    owner      = "DevOps"
    intent     = "dev environment provisioning"
  }
}
