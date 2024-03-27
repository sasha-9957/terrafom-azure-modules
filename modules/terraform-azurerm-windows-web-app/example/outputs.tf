output "windows_web_apps" {
  description = "An object containing the Azure Windows Apps created by the module."
  value       = module.windows_web_app.windows_web_apps
}
