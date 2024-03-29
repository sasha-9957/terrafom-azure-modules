module "tags" {
  source = "../modules/terraform-azurerm-tags"
  #for_each             = local.environments

  tags_params = {
    managed_by = "terraform"
    dept       = var.environment
    owner      = "DevOps"
    intent     = "${var.environment}-environment provisioning"
  }
}