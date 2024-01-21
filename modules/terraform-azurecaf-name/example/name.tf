module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_name01 = {
      name           = local.name
      prefixes       = local.prefixes
      suffixes       = local.suffixes
      random_length  = null
      random_seed    = null
      resource_type  = local.resource_type
      resource_types = null
      separator      = null
      clean_input    = local.clean_input
      passthrough    = null
      use_slug       = null
    }
  }
}
