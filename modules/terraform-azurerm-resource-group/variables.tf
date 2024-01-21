variable "resource_group_params" {
  type = map(object({
    location   = string
    name       = string
    managed_by = string
    tags       = map(string)
  }))
}
