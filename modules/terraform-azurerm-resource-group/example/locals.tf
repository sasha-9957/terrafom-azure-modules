locals {
  name          = "infra"
  prefixes      = ["hh"]
  suffixes      = ["centralus"]
  random_length = 2
  resource_type = "azurerm_resource_group"
  clean_input   = true

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

  location = "centralus"
}
