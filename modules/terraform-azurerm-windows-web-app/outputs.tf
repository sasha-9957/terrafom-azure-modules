output "windows_web_apps" {
  description = "An object containing the Azure Windows Apps created by the module."
  value       = azurerm_windows_web_app.this
}
