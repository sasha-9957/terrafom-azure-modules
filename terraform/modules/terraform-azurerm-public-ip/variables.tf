variable "azurerm_public_ip_params" {
  description = "Object map for Azure Public IP module input parameters."
  type = map(object({
    name                    = string # Required
    resource_group_name     = string # Required
    location                = string # Required
    allocation_method       = string # Required
    zones                   = set(string)
    ddos_protection_mode    = string
    ddos_protection_plan_id = string
    domain_name_label       = string
    edge_zone               = string
    idle_timeout_in_minutes = number
    ip_tags                 = map(string)
    ip_version              = string
    public_ip_prefix_id     = string
    reverse_fqdn            = string
    sku                     = string
    sku_tier                = string
    tags                    = map(string)
  }))
}
