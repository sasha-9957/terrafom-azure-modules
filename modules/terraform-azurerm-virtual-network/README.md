[//]: # (BEGIN_TF_DOCS)

### Example

```hcl
provider "azurerm" {
  features {}
}

module "name" {
  source = "app.terraform.io/captionhealth/name/azurecaf"

  azurecaf_name_params = {
    azurecaf_rg_name = {
      name          = "example"
      prefixes      = ["hh"]
      suffixes      = ["centralus"]
      random_length = 2
      random_seed   = null
      resource_type = "azurerm_resource_group"
      separator     = null
      clean_input   = true
      passthrough   = null
      use_slug      = null
    }
    azurecaf_vnet_name = {
      name          = "main"
      prefixes      = ["hh"]
      suffixes      = ["centralus"]
      random_length = 2
      random_seed   = null
      resource_type = "azurerm_virtual_network"
      separator     = null
      clean_input   = true
      passthrough   = null
      use_slug      = null
    }
  }
}

module "tags" {
  source = "app.terraform.io/captionhealth/tags/azurerm"

  tags_params = {
    Application          = "Test"
    Application_Name     = "Test"
    Application_Owner    = "devops@captionhealth.com"
    Application_Type     = "paas"
    Business_Criticality = "nobc"
    Created_On_Date      = timestamp()
    DR_Tag               = "nodr"
    Data_Classification  = "internal"
    Deployed_By          = "devops@captionhealth.com"
    Environment          = "test"
    Managed_By           = "captionhealth"
    Purpose              = "Testing"
    SLA_Tier             = "nosla"
    Status               = "test"
    Take_On_Stream       = "n/a"
  }
}

module "resource_group" {
  source = "app.terraform.io/captionhealth/resource-group/azurerm"

  resource_group_params = {
    resource_group1 = {
      location   = "centralus"
      name       = module.name.azurecaf_names["azurecaf_rg_name"].result
      managed_by = null
      tags       = module.tags.tags
    }
  }
}

module "azurerm_virtual_network" {
  source = "../"

  azurerm_virtual_network_params = {
    vnet1 = {
      name                = module.name.azurecaf_names["azurecaf_vnet_name"].result           # required
      resource_group_name = module.resource_group.resource_groups["resource_group1"].name     # required
      address_space       = ["10.0.0.0/16"]                                                   # required
      location            = module.resource_group.resource_groups["resource_group1"].location # required
      bgp_community       = null
      ddos_protection_plan = [
        # {
        #   id     = null
        #   enable = null
        # }
      ]

      encryption = [
        # {
        #   enforcement = null # required
        # }
      ]
      dns_servers             = []
      edge_zone               = null
      flow_timeout_in_minutes = null
      subnet = [
        {
          name           = "subnet1"     # required
          address_prefix = "10.0.1.0/24" # required
          security_group = null
        },
        {
          name           = "subnet2"     # required
          address_prefix = "10.0.2.0/24" # required
          security_group = null
        }
      ]

      tags = module.tags.tags
    }
  }
}
```

## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5  |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                            | Type     |
|---------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name                                                                                                                               | Description | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default | Required |
|------------------------------------------------------------------------------------------------------------------------------------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_azurerm_virtual_network_params"></a> [azurerm\_virtual\_network\_params](#input\_azurerm\_virtual\_network\_params) | n/a         | <pre>map(object({<br>    name                = string       # required<br>    resource_group_name = string       # required<br>    address_space       = list(string) # required<br>    location            = string       # required<br>    bgp_community       = string<br>    ddos_protection_plan = list(object({<br>      id     = string<br>      enable = bool<br>    }))<br>    encryption = list(object({<br>      enforcement = bool # required<br>    }))<br>    dns_servers             = list(string)<br>    edge_zone               = string<br>    flow_timeout_in_minutes = number<br>    subnet = list(object({<br>      name           = string # required<br>      address_prefix = string # required<br>      security_group = string<br>    }))<br>    tags = map(string)<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                                             | Description |
|------------------------------------------------------------------------------------------------------------------|-------------|
| <a name="output_azurerm_virtual_networks"></a> [azurerm\_virtual\_networks](#output\_azurerm\_virtual\_networks) | n/a         |

[//]: # (END_TF_DOCS)
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_virtual_network_params"></a> [azurerm\_virtual\_network\_params](#input\_azurerm\_virtual\_network\_params) | n/a | <pre>map(object({<br>    name                = string       # required<br>    resource_group_name = string       # required<br>    address_space       = list(string) # required<br>    location            = string       # required<br>    bgp_community       = string<br>    ddos_protection_plan = list(object({<br>      id     = string<br>      enable = bool<br>    }))<br>    encryption = list(object({<br>      enforcement = bool # required<br>    }))<br>    dns_servers             = list(string)<br>    edge_zone               = string<br>    flow_timeout_in_minutes = number<br>    subnet = list(object({<br>      name           = string # required<br>      address_prefix = string # required<br>      security_group = string<br>    }))<br>    tags = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_virtual_networks"></a> [virtual\_networks](#output\_virtual\_networks) | n/a |
<!-- markdown-table-prettify-ignore-end -->
<!-- END_TF_DOCS -->
