variable "azurerm_key_vault_params" {
  type = map(object({
    name                            = string # required
    location                        = string # required
    resource_group_name             = string # required
    sku_name                        = string # required
    tenant_id                       = string # required
    enabled_for_deployment          = bool
    enabled_for_disk_encryption     = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    purge_protection_enabled        = bool
    public_network_access_enabled   = bool
    soft_delete_retention_days      = number
    tags                            = map(string)

    # access_policy = map(object({
    #   tenant_id               = string # required
    #   object_id               = string # required
    #   application_id          = string
    #   certificate_permissions = list(string)
    #   key_permissions         = list(string)
    #   secret_permissions      = list(string)
    #   storage_permissions     = list(string)
    # }))

    # network_acls = map(object({
    #   bypass                     = string # required
    #   default_action             = string # required
    #   ip_rules                   = set(string)
    #   virtual_network_subnet_ids = set(string)
    # }))
  }))
}
