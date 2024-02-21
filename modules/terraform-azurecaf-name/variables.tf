variable "azurecaf_name_params" {
  description = "Object map for Azure CAF Names module input parameters."
  type = map(object({
    name           = string
    prefixes       = list(string)
    suffixes       = list(string)
    random_length  = number
    random_seed    = number
    resource_type  = string
    resource_types = list(string)
    separator      = string
    clean_input    = bool
    passthrough    = bool
    use_slug       = bool
  }))
}
