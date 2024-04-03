variable "resource_group_params" {
  description = "Object map for Azure Resource Groups module input parameters."
  type = map(object({
    location   = string
    name       = string
    managed_by = string
    tags       = map(string)
  }))
}
