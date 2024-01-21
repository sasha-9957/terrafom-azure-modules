resource "azurecaf_name" "this" {
  for_each = var.azurecaf_name_params

  name           = each.value.name
  prefixes       = each.value.prefixes
  suffixes       = each.value.suffixes
  random_length  = each.value.random_length
  random_seed    = each.value.random_seed
  resource_type  = each.value.resource_type
  resource_types = each.value.resource_types
  separator      = each.value.separator
  clean_input    = each.value.clean_input
  passthrough    = each.value.passthrough
  use_slug       = each.value.use_slug
}
