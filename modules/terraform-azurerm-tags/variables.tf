variable "tags_params" {
  type = object({
    managed_by = string
    dept       = string
    owner      = string
    intent     = string
  })
}
