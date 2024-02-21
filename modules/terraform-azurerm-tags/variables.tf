variable "tags_params" {
  description = "Object map for Azure Tags module input parameters."
  type = object({
    managed_by = string
    dept       = string
    owner      = string
    intent     = string
  })
}
