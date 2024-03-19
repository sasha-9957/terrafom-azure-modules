module "service_principal_certificate" {
  source  = "app.terraform.io/captionhealth/service-principal-certificate/azuread"
  version = "1.0.0"

  service_principal_certificate_params = {
    main_principal_certificate = {
      encoding             = null
      end_date             = "2024-04-01T01:02:03Z"
      end_date_relative    = null
      key_id               = null
      service_principal_id = module.azuread_service_principal.service_principals["main_service_principal"].id # Required
      start_date           = null
      type                 = "AsymmetricX509Cert" # Required
      value                = file("cert.pem")     # Required
    }
  }
}
