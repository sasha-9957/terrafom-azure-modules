module "tags" {
  source = "../../modules/terraform-azurerm-tags"

  tags_params = {
    managed_by = "terraform"
    dept       = "dev"
    owner      = "DevOps"
    intent     = "dev environment provisioning"
  }
}
